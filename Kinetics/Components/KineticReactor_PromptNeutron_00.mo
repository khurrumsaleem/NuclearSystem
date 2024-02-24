within NuclearSystem.Kinetics.Components;

model KineticReactor_PromptNeutron_00
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
  parameter Real n0_par= 1e12 "initial neutron density";
  parameter units.Volume Vol_par= 1.0;
  parameter Real kFuelDens_par=0.001 "";
  parameter Real NnukeFuel_par = 0.05*(19*10^6/238)*conv.factor_mole2num() "nuclear number density, [num/m3]";
  //0.1811*10^6*conversion.factor_mole2num()/0.23504393
  //19*10^6/238*6.02*10^23 "nuclear number density, [num/m3], U235:(l9×10^6/238）×6.02×10^23";
  parameter units.Energy Efiss_par = 200*10^6*conv.factor_eV2J();
  parameter Real nu_par=2.43 "average number of neutrons produced per fission";
  parameter units.Area sigmaF_par=1.199*10^(-28) "microscopic fission cross section";
  parameter units.Velocity v_par=CmnConsts.vNeuFree_Fission_1MeV "neutron velocity";
  
  //parameter units.Time LAMBDA_par= 0.0001;
  
  /*-----------------------------------
  internal objects
  -----------------------------------*/
  NuclearSystem.Constants.Common CmnConsts;
  units.NeutronNumberDensity n;
  units.NeutronNumberDensity n0;
  Real Nneu "num of neutron";
  Real Nneu0 "initial  num of neutron";
  units.Time LAMBDA "neutron generation time";
  Real nu "average number of neutrons produced per fission";
  units.MacroscopicCrossSection SIGMAf "macroscopic fission cross section";
  units.Velocity v "neutron velocity";
  Real rho "reactivity";
  Real kEff; 
  Real PHI "neutron flux, 1/(m2*s)";
  units.Volume Vol "";
  units.Power pwr "power";
  units.Energy engy "";
  Real engy_TNTeq;
  units.Power pwr0 "pwr at t=0";
  Real pwrRel0 "pwr/pwr0";
  units.Time T "characteristic time(or time constant in linear system)";
  
  /*-----------------------------------
  interfaces
  -----------------------------------*/
  
  Modelica.Blocks.Interfaces.RealInput u_rho "reactivity input" annotation(
    Placement(transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));

initial equation
  n= n0;
  pwr0=pwr;
  
equation
  when(time==0)then
    pwr0= pwr;
  end when;
  
  n0= n0_par;
  Nneu0= n0*Vol;
  
  nu= nu_par;
  v= v_par;
  Vol= Vol_par;
  
  SIGMAf= sigmaF_par*(NnukeFuel_par*kFuelDens_par);
  
  rho= u_rho;
  rho= (kEff-1)/kEff;
  
  LAMBDA=1/(nu*SIGMAf*v);
  
  der(n)= (rho/LAMBDA)*n;
  Nneu= n*Vol;
  
  PHI=n*v;
  
  pwr= Efiss_par*SIGMAf*PHI*Vol;
  pwr= der(engy);
  engy_TNTeq = engy/(4.184*10^9);
  pwrRel0=pwr/pwr0;
  
  if(0.0<abs(rho))then
    T= LAMBDA/rho;
  else
    T= 0.0;
  end if;
  
annotation(
    defaultComponentName = "PtRctr",
  Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})})
    ,
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end KineticReactor_PromptNeutron_00;
