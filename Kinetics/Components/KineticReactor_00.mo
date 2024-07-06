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
  //parameter Real numNeu0_par= 1e12 "initial number of neutron";
  parameter Real denNeu0_par = 1e14 "initial neutron density";
  parameter units.Volume Vol_par = 1.0;
  parameter Real kFuelDens_par = 0.001 "";
  parameter Real denNnukeFuel_par = 0.05*(19*10^6/238)*conv.factor_mole2num() "nuclear number density, [num/m3]";
  parameter units.Energy Efiss_par = 200*10^6*conv.factor_eV2J();
  parameter Real nu_par = 2.43 "average number of neutrons produced per fission";
  parameter units.Area sigmaF_par = 1.199*10^(-28) "microscopic fission cross section";
  parameter units.Velocity v_par = CmnConsts.vNeuFree_Fission_1MeV "neutron velocity";
  parameter Integer nPrecursor_par = 6 "";
  parameter Real beta_par[nPrecursor_par] = {0.000215, 0.001424, 0.001274, 0.002568, 0.000748, 0.000273};
  parameter units.DecayConstant lambda_par[nPrecursor_par] = {0.0126, 0.0337, 0.139, 0.325, 1.13, 3.5};
  //-------------------------
  parameter Boolean use_HeatTransfer = false
  "= true to use the HeatTransfer model"
      annotation (Dialog(tab="Assumptions", group="Heat transfer"));
  parameter Boolean use_u_Vol = false
  "= true to use Vol input signal"
      annotation (Dialog(tab="General", group="Switches"));
  
  
  /*-----------------------------------
      internal objects
      -----------------------------------*/
  NuclearSystem.Constants.Common CmnConsts;
  Real denNnukeFuel "num density of nuclear fuel";
  Real numNukeFuel "num of nuclei";
  units.NeutronNumberDensity denNeu;
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
  Real engy_TNTeq;
  units.Time T "characteristic time(or time constant in linear system)";
  Real rho_dollar "rho/betaTotal";
  Real rho_cent "rho/betaTotal*100";
  //---
  discrete units.Power pwr0 "pwr at t=0";
  discrete units.Time LAMBDA0 "neutron generation time, at time=0";
  discrete units.NeutronNumberDensity denNeu0;
  discrete Real nNeu0 "initial num of neutron";
  discrete Real C0[nPrecursor_par];
  discrete Real nC0[nPrecursor_par];
  discrete Real rho0 "initial reactivity";
  discrete Real NnukeFuel0 "num density of nuclear fuel";
  discrete Real numNukeFuel0 "initial num of nuclei";
  //---
  Real pwrRel0 "pwr/pwr0";
  Real denNeuRel0 "denNeu/denNeu0";
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
  //---
  /*-----------------------------------
      interfaces
  -----------------------------------*/
  Modelica.Blocks.Interfaces.RealInput u_rho "reactivity input" annotation(
    Placement(transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_Vol if use_u_Vol "volume input" annotation(
    Placement(transformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}})));

  Modelica.Blocks.Interfaces.RealOutput y_pwr(unit = "W", displayUnit = "W") "" annotation(
    Placement(transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, -40}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput y_pwrRel0 annotation(
    Placement(transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, -60}, extent = {{-5, -5}, {5, 5}})));
  Interface.Bus bus annotation(
    Placement(transformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if use_HeatTransfer
    annotation (Placement(transformation(origin = {200, 0}, extent = {{-110, -10}, {-90, 10}}), iconTransformation(origin = {200, 0}, extent = {{-110, -10}, {-90, 10}})));
  //**********************************************************************
  Modelica.Blocks.Interfaces.RealOutput y_der_nNeu annotation(
    Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, 40}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealOutput y_derNneuqNneu annotation(
    Placement(transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {105, 60}, extent = {{-5, -5}, {5, 5}})));
initial equation
  pwr0 = pwr;
  LAMBDA0 = LAMBDA;
  nNeu0 = denNeu0*Vol;
  numNukeFuel0= NnukeFuel0*Vol;
//----
  denNeu0 = denNeu0_par;
  NnukeFuel0= denNnukeFuel_par;
//----
  denNeu = denNeu0;
  for i in 1:nPrecursor_par loop
    C[i] = C0[i];
    der(C[i])=0.0;
  end for;
  
  der(denNeu)=0.0;
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
  when (time == 0) then
    denNeu0 = denNeu;
//-----
    pwr0 = pwr;
    LAMBDA0 = LAMBDA;
    nNeu0 = nNeu;
    rho0 = rho;
    NnukeFuel0= denNnukeFuel;
    numNukeFuel0= numNukeFuel;
    for i in 1:nPrecursor_par loop
      C0[i]=C[i];
      nC0[i]=nC[i];
    end for;
  end when;
//----------
  rho = u_rho;
  y_pwr = pwr;
  y_pwrRel0 = pwrRel0;
  y_der_nNeu= der(nNeu);
  y_derNneuqNneu= derNneuqNneu;
  
  if (use_HeatTransfer == true) then
    heatPort.Q_flow= -1.0*pwr;
  end if;
//----------
  SIGMAf = sigmaF_par*(denNnukeFuel*kFuelDens_par);
  rho = (kEff - 1)/kEff;
  LAMBDA = 1/(nu*SIGMAf*v);
//-----
//-
  for i in 1:nPrecursor_par loop
    der(nC[i]) = beta[i]/LAMBDA*nNeu - lambda[i]*nC[i];
    lambdaNC[i] = lambda[i]*nC[i];
    lambdaC[i] = lambda[i]*C[i];
//-----
    Crel0[i] = C[i]/C0[i];
    nC[i]= C[i]*Vol;
  end for;
//-
  betaTotal = sum(beta);
  SIGMA_lambdaC = sum(lambdaC);
  SIGMA_lambdaNC = sum(lambdaNC);
  
  der(nNeu) = ((rho - betaTotal)/LAMBDA)*nNeu + SIGMA_lambdaNC;
//-----
  numNukeFuel= numNukeFuel0;
  denNnukeFuel= numNukeFuel/Vol;
  nNeu = denNeu*Vol;
  
  PHI = denNeu*v;
  pwr = Efiss_par*SIGMAf*PHI*Vol;
  pwr = der(engy);
//-----
  engy_TNTeq = engy/(4.184*10^9);
  if (0.0 < abs(rho-betaTotal)) then
    T = LAMBDA/(rho-betaTotal);
  else
    T = 0.0;
  end if;
//-----
  derNneuqNneu= der(nNeu)/nNeu;
  denNeuRel0 = denNeu/denNeu0;
  pwrRel0 = pwr/pwr0;
  rho_dollar= rho/betaTotal;
  rho_cent= rho_dollar*100.0;
//----------
  annotation(
    defaultComponentName = "PtRctr",
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -118}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end KineticReactor_00;
