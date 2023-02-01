within NuclearSystem.Kinetics.Examples.Temp;

model FissionExplosionDeviceCore_ex01_v001
  extends Modelica.Icons.Example;
  //******************************
  import units = Modelica.Units.SI;
  /******************************
      Parameters
      ******************************/
  parameter Real NcoreInit = (143*9.48*10^20)*10^6 "neutron number density, []";
  parameter Real nInit = 0.1811*10^6*6.02214606*10^23/0.23504393 "nuclear number density, [num/m3]";
  parameter Real RthreshBare = 8.4/100 "";
  parameter units.Area sigmaF_par = 1.199*10^(-28) "";
  parameter units.Area sigmaEl_par = 3.650*10^(-28) "";
  parameter Real nu_par = 2.43 "2.43 for U235";
  parameter units.Velocity vNeutron_par = 1.4*10^7;
  parameter Real alphaInit_par = 0.0;
  parameter units.Energy Efiss = 180*10^6*1.602176634*10^(-19);
  parameter Real gamma_par = 1/3;
  parameter units.Length rInit_par = 7/100;
  parameter units.Density rhoCore = 18.71*1000 "";
  parameter Real mMolar = 235.04393 "molar mass";
  /******************************
      Variables
      ******************************/
  Real dCore "size of critical radius";
  Real lambdaCoreTrans "transport mean free path for neutrons";
  Real sigmaF "fission cross-section of fissile core material";
  Real nu "secondary neutrons: number of neutrons emitted per fission";
  Real sigmaT "transport cross-section";
  Real sigmaEl "elastic-scattering cross section";
  Real vNeutron "average neutron speed";
  units.Volume volCore "";
  Real n "nuclear number density";
  Real lambdaCoreFiss "mean free path for neutrons btwn fissions";
  Real alpha "separation of variables in solving diffusion equation";
  Real r(start = RthreshBare) "";
  units.Pressure pCore "";
  units.Velocity vCoreExp "";
  Real gamma "";
  Real tau "average time that neutron will travel before causing fission";
  units.Energy Eemit "";
  units.Energy EkCore "";
  Real dVoldt "";
  Real nNuke;
  Real Eemit_TNTeq;
  /*
      Real Ncore "number density of neutron";
      discrete Real alphaDes "";
      discrete Real RC "core radius";
      
      */
protected
  //parameter Real nNuke(fixed=false) annotation(HideResult=false);
  parameter Real volCoreInit(fixed = false) annotation(
    HideResult = false);
  parameter units.Length rInit(fixed = false) annotation(
    HideResult = false);
  parameter units.Mass mCore(fixed = false) "" annotation(
    HideResult = false);
initial equation
  r = rInit_par;
  volCoreInit = 4.0/3.0*rInit_par^3.0;
  mCore = rhoCore*volCore;
//Eemit = (NcoreInit*volCore*Efiss/tau);
equation
  nNuke = nInit*(4/3*rInit_par^3);
  n = nNuke/volCore;
//-----
  sigmaF = sigmaF_par;
  sigmaEl = sigmaEl_par;
  gamma = gamma_par;
  nu = nu_par;
//-----
  sigmaT = sigmaF + sigmaEl;
  vNeutron = vNeutron_par;
  volCore = 4.0/3.0*r^3.0;
  lambdaCoreFiss = 1.0/(sigmaF*n);
  lambdaCoreTrans = 1.0/(sigmaT*n);
  tau = lambdaCoreFiss/vNeutron;
  dCore = sqrt((lambdaCoreFiss*lambdaCoreTrans)/(3.0*(-alpha + nu - 1.0)));
  (r/dCore)*1.0/tan(r/dCore) + (3*dCore/(2.0*lambdaCoreTrans))*(r/dCore) - 1.0 = 0.0;
  pCore = gamma*Eemit/volCore;
  der(Eemit) = (NcoreInit*volCore*Efiss/tau)*exp((alpha/tau)*time);
  der(EkCore) = dVoldt*pCore;
  der(r) = vCoreExp;
  der(volCore) = dVoldt;
  der(vCoreExp) = 4*Modelica.Constants.pi*r^2*gamma*Eemit/(volCore*mCore);
  Eemit_TNTeq = Eemit/(4.184*10^9);
  annotation(
    experiment(StartTime = 0, StopTime = 1e-08, Tolerance = 1e-06, Interval = 1e-11));
end FissionExplosionDeviceCore_ex01_v001;
