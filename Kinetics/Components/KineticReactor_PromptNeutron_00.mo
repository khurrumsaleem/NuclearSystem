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
  import conversion = NuclearSystem.Constants.UnitConversions;
  
  /*-----------------------------------
  parameters
  -----------------------------------*/
  parameter Real numNeut0_par= 1 "initial number of neutron";
  parameter units.Volume Vol_par= 1.0;
  parameter Real kFuelDens_par=0.001 "";
  parameter Real NnukeFuel_par = 0.05*(19*10^6/238)*conversion.factor_mole2num() "nuclear number density, [num/m3]";
  //0.1811*10^6*conversion.factor_mole2num()/0.23504393
  //19*10^6/238*6.02*10^23 "nuclear number density, [num/m3], U235:(l9×10^6/238）×6.02×10^23";
  
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
  units.Time LAMBDA "neutron generation time";
  Real nu "average number of neutrons produced per fission";
  units.MacroscopicCrossSection SIGMAf "macroscopic fission cross section";
  units.Velocity v "neutron velocity";
  Real rho "reactivity";
  Real kEff; 
  
  
  
  /*-----------------------------------
  interfaces
  -----------------------------------*/
  
  Modelica.Blocks.Interfaces.RealInput u_rho "reactivity input" annotation(
    Placement(transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));

initial equation
  n= n0;


equation
  n0= numNeut0_par/Vol_par;
  
  nu= nu_par;
  SIGMAf= sigmaF_par*(NnukeFuel_par*kFuelDens_par);
  v= v_par;
  
  rho= u_rho;
  rho= (kEff-1)/kEff;
  
  LAMBDA=1/(nu*SIGMAf*v);
  
  der(n)= (rho/LAMBDA)*n;
  
  
annotation(
    defaultComponentName = "PtRctr",
  Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})})
    ,
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end KineticReactor_PromptNeutron_00;
