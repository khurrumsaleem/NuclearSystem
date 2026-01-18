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
  
  parameter NuclearSystem.Types.Switches.switch_causal_neutronFlux switchCausal_PHI0= NuclearSystem.Types.Switches.switch_causal_neutronFlux.den2PHI annotation (Dialog(group="Switches"));
  
  
  parameter Real der_denNneu0_par = 0.0 if switchInit_derDenNneu==NuclearSystem.Types.Switches.switch_initialization.FixedInitial "initial der(neutron density)" annotation (Dialog(tab="Initialization", group="Initial"));
  
  
  
  /*-----------------------------------
      internal objects
      -----------------------------------*/
  NuclearSystem.Constants.Common CmnConsts;
  Real nNukeFuel "num of nuclei";
  Real nNeu "num of neutron";
  units.Time LAMBDA "neutron generation time";
  Real nu "average number of neutrons produced per fission";
  units.Area sigmaF "microscopic fission cross section";
  units.MacroscopicCrossSection SIGMAf "macroscopic fission cross section";
  units.Velocity v "neutron velocity";
  Real rho "reactivity";
  //Real kEff;
  units.Volume Vol "";
  units.Power pwr "power";
  units.Energy engy "";
  Real engy_TNTeq "Ton (4.2 × 10^12 Joule/kt)";
  units.Time Tchar "characteristic time(or time constant in linear system)";
  Real rho_dollar "rho/betaTotal";
  Real rho_cent "rho/betaTotal*100";
  units.Mass massFuel;
  //---
  Real pwrRel0 "pwr/pwr0";
  Real derNneuqNneu "der(nNeu)/nNeu";
  //---
  Real beta[nPrecursor_par];
  Real betaTotal;
  Real nC[nPrecursor_par] "number of precursor";
  units.DecayConstant lambda[nPrecursor_par];
  Real lambdaNC[nPrecursor_par];
  Real SIGMA_lambdaNC;
  
  Real derVol "m3/s, time derivative of core volume";
  Real denNnukeFuel "num density of nuclear fuel";
  
  
  
  //Real denNneuRel0 "denNneu/denNneu0";
  //units.Power denPwr "power density, W/m3";
  //Real C[nPrecursor_par] "precursor density";
  //Real Crel0[nPrecursor_par] "C/C0";
  //units.NeutronNumberDensity denNneu;
  //Real PHI "neutron flux, 1/(m2*s)";
  //units.NeutronNumberDensity lambdaC[nPrecursor_par];
  //units.NeutronNumberDensity SIGMA_lambdaC;
  
  
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
    Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, 40}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput y_derNneuqNneu annotation(
    Placement(transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, 60}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput y_massFuel0 annotation(
    Placement(transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, -80}, extent = {{-5, -5}, {5, 5}})));

  //**********************************************************************
protected
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
  parameter units.MacroscopicCrossSection SIGMAf0(fixed=false) "macroscopic fission cross section";

//**********************************************************************
initial equation
  denNnukeFuel= denNnukeFuel_par;
  SIGMAf0 = sigmaF_par*(denNnukeFuel*s_FuelDens_par);
  //----
  /**/
  if(use_u_Vol==true)then
    Vol0= u_Vol;
  else
    Vol0 = Vol_par;
  end if;
  
  
  //----
  if(switchCausal_PHI0==NuclearSystem.Types.Switches.switch_causal_neutronFlux.PHI2den)then
    PHI0=PHI0_par;
    denNneu0=PHI0/v;
  elseif(switchCausal_PHI0==NuclearSystem.Types.Switches.switch_causal_neutronFlux.den2PHI)then
    denNneu0 = denNneu0_par; 
    PHI0 = denNneu0*v;
  end if;
  
  //----
  massFuel0= Vol0*denMassFuel_par;
  nNeu0 = denNneu0*Vol0;
  pwr0 = Efiss_par*SIGMAf0*v*nNeu;
  
  
  //----
  denPwr0= pwr0/Vol0;
  LAMBDA0 = LAMBDA;
  nNeu0 = nNeu;
  rho0 = rho;
  Vol0=Vol;
  denNnukeFuel0= denNnukeFuel;
  
  for i in 1:nPrecursor_par loop
    //C0[i]=C[i];
    nC0[i]=nC[i];
    C0[i]=nC0[i];
  end for;
  
  for i in 1:nPrecursor_par loop
    nC[i] = beta_par[i] / (LAMBDA0 * lambda_par[i]) * nNeu0;
  end for;
  
  //----
  /*
  if(switchInit_derDenNneu==NuclearSystem.Types.Switches.switch_initialization.FixedInitial)then
    der(denNneu)=0.0;
  end if;
  */
  
//**********************************************************************
algorithm
  /*
  denNneu:= nNeu/Vol;
  denNnukeFuel:= nNukeFuel/Vol;
  
  for i in 1:nPrecursor_par loop
    C[i]:= nC[i]/Vol;
  end for;
  
  denPwr:= pwr/Vol;
  */
//**********************************************************************
equation
  //-----
  for i in 1:nPrecursor_par loop
    beta[i] = beta_par[i];
    lambda[i] = lambda_par[i];
  end for;
  
  //---
  nu = nu_par;
  v = v_par;
  sigmaF= sigmaF_par;
  
  //---
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
  
  if (use_HeatTransfer == true) then
    heatPort.Q_flow= -1.0*pwr;
  end if;
//----------
  SIGMAf = sigmaF_par*(denNnukeFuel*s_FuelDens_par);
  //rho = (kEff - 1)/kEff;
  LAMBDA = 1/(nu*SIGMAf*v);
//-----
//-
  for i in 1:nPrecursor_par loop
    der(nC[i]) = beta[i]/LAMBDA*nNeu - lambda[i]*nC[i];
    //der(C[i]) = beta[i]/LAMBDA*denNneu - lambda[i]*C[i] - C[i]*derVol/Vol;
    //nC[i]= C[i]*Vol;
    lambdaNC[i] = lambda[i]*nC[i];
    //lambdaC[i] = lambdaNC[i]/Vol;
  end for;
//-
  betaTotal = sum(beta);
  //SIGMA_lambdaC = sum(lambdaC);
  SIGMA_lambdaNC = sum(lambdaNC);
  
  der(Vol)= derVol;
  
  der(nNeu) = ((rho - betaTotal)/LAMBDA)*nNeu + SIGMA_lambdaNC;
  pwr = Efiss_par*SIGMAf*v*nNeu;

  
  
//-----
  massFuel=massFuel0;
  nNukeFuel= nNukeFuel0;
  
  nNukeFuel= denNnukeFuel*Vol;
  
  //PHI = denNneu*v;
  //denNneu = nNeu/Vol;
  der(engy) = pwr;
//-----
  engy_TNTeq = engy/(4.184*10^9);
  if noEvent(0.0 < abs(rho-betaTotal)) then
    Tchar = LAMBDA/(rho-betaTotal);
  else
    Tchar = 0.0;
  end if;
//-----
  derNneuqNneu= der(nNeu)/nNeu;
  pwrRel0 = pwr/pwr0;
  
  /*
  for i in 1:nPrecursor_par loop
    Crel0[i] = C[i]/C0[i];
  end for;
  */
  
  rho_dollar= rho/betaTotal;
  rho_cent= rho_dollar*100.0;
  //denPwr= pwr/Vol;
  //denNneuRel0 = denNneu/denNneu0;
  
//----------
  annotation(
    defaultComponentName = "PtRctr",
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -118}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));



end KineticReactor_00;
