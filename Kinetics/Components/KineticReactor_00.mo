within NuclearSystem.Kinetics.Components;

model KineticReactor_00
  /*-----------------------------------
      inheritance
      -----------------------------------*/
  extends NuclearSystem.Icons.FissionReaction;
  /*-----------------------------------
      imports
      -----------------------------------*/
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  import conv = NuclearSystem.Constants.UnitConversions;
  /*-----------------------------------
      parameters
      -----------------------------------*/
  parameter Real denNneu0_par = 1e14 "initial neutron density";
  parameter Real PHI0_par=1e15 "neutron flux, 1/(m2*s)";
  parameter units.Volume Vol_par = 1.0;
  parameter Real s_FuelDens_par = 1.0 "corelation coefficient to manipulate design point power";
  parameter Real denNnukeFuel_par = 0.05*(18.71*10^6/238)*conv.factor_mole2num() "nuke num density, [num/m3], denNNuke= denMass*const.N_A/AM";
  parameter units.Energy Efiss_par = 200*10^6*conv.factor_eV2J();
  parameter Real nu_par = 2.43 "average number of neutrons produced per fission";
  parameter units.Area sigmaF_par = 1.199*10^(-28) "microscopic fission cross section";
  parameter units.Velocity v_par = CmnConsts.vNeuFree_Fission_1MeV "neutron velocity";
  parameter Integer nPrecursor_par = 6 "";
  parameter Real beta_par[nPrecursor_par] = {0.000215, 0.001424, 0.001274, 0.002568, 0.000748, 0.000273};
  parameter units.DecayConstant lambda_par[nPrecursor_par] = {0.0126, 0.0337, 0.139, 0.325, 1.13, 3.5};
  parameter units.Density denMassFuel_par=18.71*1000 "fuel mass density";
  //-------------------------
  parameter Boolean use_HeatTransfer = true
  "= true to use the HeatTransfer model"
      annotation (Dialog(tab="Assumptions", group="Heat transfer"));
  parameter Boolean use_u_Vol = false
  "= true to use Vol input signal"
      annotation (Dialog(tab="General", group="Switches"));
  
  //-------------------------
  parameter NuclearSystem.Types.Switches.switch_initialization switchInit_derDenNneu= NuclearSystem.Types.Switches.switch_initialization.Free annotation (Dialog(tab="Initialization", group="Switches"));
  
  parameter NuclearSystem.Types.Switches.switch_initialization switchInit_der_nNeu= NuclearSystem.Types.Switches.switch_initialization.Free annotation (Dialog(tab="Initialization", group="Switches"));
  
  
  parameter NuclearSystem.Types.Switches.switch_causal_neutronFlux switchCausal_PHI0= NuclearSystem.Types.Switches.switch_causal_neutronFlux.den2PHI annotation (Dialog(group="Switches"));
  
  
  parameter Real der_denNneu0_par = 0.0 if switchInit_derDenNneu==NuclearSystem.Types.Switches.switch_initialization.FixedInitial "initial der(neutron density)" annotation (Dialog(tab="Initialization", group="Initial"));
  
  parameter Real der_nNeu0_par = 0.0 if switchInit_der_nNeu==NuclearSystem.Types.Switches.switch_initialization.FixedInitial "initial der(neutron number)" annotation (Dialog(tab="Initialization", group="Initial"));
  
  
  /*-----------------------------------
      internal objects
      -----------------------------------*/
  NuclearSystem.Constants.Common CmnConsts;
  Real denNnukeFuel "num density of nuclear fuel";
  Real nNukeFuel "num of nuclei";
  units.NeutronNumberDensity denNneu;
  Real nNeu "num of neutron";
  units.Time LAMBDA "neutron generation time";
  Real nu "average number of neutrons produced per fission";
  units.Area sigmaF "microscopic fission cross section";
  units.MacroscopicCrossSection SIGMAf "macroscopic fission cross section";
  units.Velocity v "neutron velocity";
  Real rho "reactivity";
  Real kEff;
  Real PHI "neutron flux, 1/(m2*s)";
  units.Volume Vol "";
  units.Power pwr "power";
  units.Energy engy "";
  Real engy_TNTeq "Ton (4.2 × 10^12 Joule/kt)";
  units.Time Tchar "characteristic time(or time constant in linear system)";
  Real rho_dollar "rho/betaTotal";
  Real rho_cent "rho/betaTotal*100";
  //---
  /*
  discrete units.Power pwr0 "pwr at t=0";
  discrete units.Time LAMBDA0 "neutron generation time, at time=0";
  discrete units.NeutronNumberDensity denNneu0;
  discrete Real PHI0;
  discrete Real nNeu0 "initial num of neutron";
  discrete Real C0[nPrecursor_par];
  discrete Real nC0[nPrecursor_par];
  discrete Real rho0 "initial reactivity";
  discrete Real denNnukeFuel0 "num density of nuclear fuel";
  discrete Real nNukeFuel0 "initial num of nuclei";
  discrete units.Volume Vol0;
  discrete units.Mass massFuel0;
  discrete units.Power denPwr0 "power density, W/m3";
  */
  //---
  Real pwrRel0 "pwr/pwr0";
  Real denNneuRel0 "denNneu/denNneu0";
  Real Crel0[nPrecursor_par] "C/C0";
  Real derNneuqNneu "der(nNeu)/nNeu";
  //---
  Real beta[nPrecursor_par];
  Real betaTotal;
  Real C[nPrecursor_par] "precursor density";
  Real nC[nPrecursor_par] "number of precursor";
  units.DecayConstant lambda[nPrecursor_par];
  units.NeutronNumberDensity lambdaC[nPrecursor_par];
  Real lambdaNC[nPrecursor_par];
  units.NeutronNumberDensity SIGMA_lambdaC;
  Real SIGMA_lambdaNC;
  units.Power denPwr "power density, W/m3";
  units.Mass massFuel;
  //---
  /*-----------------------------------
      interfaces
  -----------------------------------*/
  Modelica.Blocks.Interfaces.RealInput u_rho "reactivity input" annotation(
    Placement(transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_Vol if use_u_Vol "volume input" annotation(
    Placement(transformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}})));
  //----------
  Modelica.Blocks.Interfaces.RealOutput y_pwr(unit = "W") "" annotation(
    Placement(transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, -40}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput y_pwrRel0 annotation(
    Placement(transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, -60}, extent = {{-5, -5}, {5, 5}})));
  Interface.Bus bus annotation(
    Placement(transformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if use_HeatTransfer
    annotation (Placement(transformation(origin = {200, 0}, extent = {{-110, -10}, {-90, 10}}), iconTransformation(origin = {200, 0}, extent = {{-110, -10}, {-90, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_der_nNeu annotation(
    Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, 60}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput y_derNneuqNneu annotation(
    Placement(transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, 80}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput y_massFuel0 annotation(
    Placement(transformation(origin = {110, -78}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, -80}, extent = {{-5, -5}, {5, 5}})));

  //**********************************************************************
protected
  //--
  parameter units.Power pwr0(fixed=false) "pwr at t=0" annotation(HideResult = false);
  parameter units.Time LAMBDA0(fixed=false) "neutron generation time, at time=0" annotation(HideResult = false);
  parameter units.NeutronNumberDensity denNneu0(fixed=false) annotation(HideResult = false);
  parameter Real PHI0(fixed=false) annotation(HideResult = false);
  parameter Real nNeu0(fixed=false) "initial num of neutron" annotation(HideResult = false);
  parameter Real C0[nPrecursor_par](each fixed=false) annotation(HideResult = false);
  parameter Real nC0[nPrecursor_par](each fixed=false) annotation(HideResult = false);
  parameter Real rho0(fixed=false) "initial reactivity" annotation(HideResult = false);
  parameter Real denNnukeFuel0(fixed=false) "num density of nuclear fuel" annotation(HideResult = false);
  parameter Real nNukeFuel0(fixed=false) "initial num of nuclei" annotation(HideResult = false);
  parameter units.Volume Vol0(fixed=false) annotation(HideResult = false);
  parameter units.Mass massFuel0(fixed=false) annotation(HideResult = false);
  parameter units.Power denPwr0(fixed=false) "power density, W/m3" annotation(HideResult = false);
  
  //**********************************************************************
public
  Modelica.Blocks.Interfaces.RealOutput y_pwr0 annotation(
    Placement(transformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, 40}, extent = {{-5, -5}, {5, 5}})));
initial equation
  //----
  if(switchCausal_PHI0==NuclearSystem.Types.Switches.switch_causal_neutronFlux.PHI2den)then
    PHI=PHI0_par;
  elseif(switchCausal_PHI0==NuclearSystem.Types.Switches.switch_causal_neutronFlux.den2PHI)then
    denNneu = denNneu0_par;
  end if;
  
//----
  der(nNeu) = ((rho - betaTotal)/LAMBDA)*nNeu0 + SIGMA_lambdaNC;
  //----
    
  massFuel0= Vol0*denMassFuel_par;
  denNnukeFuel0=denNnukeFuel_par;
  nNukeFuel0= denNnukeFuel0*Vol0;
  
  /**/
  for i in 1:nPrecursor_par loop
    der(C[i])=0.0;
  end for;
  /*
  for i in 1:nPrecursor_par loop
    C[i]=0.0;
  end for;
  */
  //-----
  if(switchInit_derDenNneu==NuclearSystem.Types.Switches.switch_initialization.FixedInitial)then
    der(denNneu)=0.0;
  end if;
  
  if(switchInit_der_nNeu==NuclearSystem.Types.Switches.switch_initialization.FixedInitial)then
    der(nNeu)=0.0;
  end if;
  
  //-----
  pwr0=pwr;
  LAMBDA0=LAMBDA;
  denNneu0=denNneu;
  PHI0=PHI;
  rho0=rho;
  Vol0=Vol;
  denPwr0=denPwr;
  for i in 1:nPrecursor_par loop
    C0[i]=C[i];
    nC0[i]=nC[i];
  end for;
  
  /*
  print("nNeu0="+String(nNeu0));
  */
//**********************************************************************
initial algorithm
//**********************************************************************
algorithm
//**********************************************************************
equation
  
  for i in 1:nPrecursor_par loop
    beta[i] = beta_par[i];
    lambda[i] = lambda_par[i];
  end for;
  
  nu = nu_par;
  v = v_par;
  sigmaF= sigmaF_par;
  
  if(use_u_Vol==true)then
    Vol= u_Vol;
  else
    Vol = Vol_par;
  end if;
  
//----------
  rho = u_rho;
  y_pwr = pwr;
  y_pwrRel0 = pwrRel0;
  y_der_nNeu= der(nNeu);
  y_derNneuqNneu= derNneuqNneu;
  y_massFuel0=massFuel0;
  y_pwr0=pwr0;
  
  if (use_HeatTransfer == tr