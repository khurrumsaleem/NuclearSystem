within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model FissionExplosionDeviceCore_ex02
  extends Modelica.Icons.Example;
  //******************************
  import units = Modelica.Units.SI;
  import conv = NuclearSystem.Constants.UnitConversions;
  /******************************
                  Parameters
                  ******************************/
  parameter Real nNeutInit = 1;
  parameter Real NcoreInit = nNeutInit/(4/3*Modelica.Constants.pi*rInit_par^3) "neutron number density, []";
  parameter Real kNnukDen = 1.0 "multiplication factor onto nuclear number density";
  parameter Real nInit = 0.1811*10^6*conv.factor_mole2num()/0.23504393 "nuclear number density, [num/m3]";
  parameter Real RthreshBare = 8.4/100 "";
  parameter units.Area sigmaF_par = 1.199*10^(-28) "";
  parameter units.Area sigmaEl_par = 3.650*10^(-28) "";
  parameter Real nu_par = 2.43 "2.43 for U235";
  parameter units.Velocity vNeutron_par = CmnConsts.vNeuFree_Fission_1MeV;
  parameter Real alphaInit_par = 0.0;
  parameter units.Energy Efiss = 180*10^6*conv.factor_eV2J();
  parameter Real gamma_par = 1/3;
  parameter units.Length rInit_par = 4.5/100;
  parameter units.Density rhoCore = 18.71*1000 "";
  parameter Real mMolar = 235.04393 "molar mass";
  parameter units.Time tDet_par = 0.0e-7 "detonation timing";
  parameter units.Pressure pCoreInit = 100*1000 "initial core pressure";
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
  Real alpha(min = 0.0) "separation of variables in solving diffusion equation";
  units.Length r(start=rInit_par) "";
  units.Pressure pCore "";
  units.Velocity vCoreExp "";
  Real gamma "";
  Real tau "average time that neutron will travel before causing fission";
  units.Energy Eemit "";
  units.Energy EkCore "";
  Real dVoldt "";
  Real nNuke;
  Real Eemit_TNTeq;
  Real FissRate "rate of fission, times/sec";
  Real nCumFiss "cumulative number of fissions";
  units.Time tAfterDet "time after detonation";
  /******************************
                  Internal objects
              ******************************/
  Constants.Common CmnConsts;
protected
  parameter Real volCoreInit(fixed = false) annotation(
    HideResult = false);
  parameter units.Length rInit(fixed = false) annotation(
    HideResult = false);
  parameter units.Mass mCore(fixed = false) "" annotation(
    HideResult = false);
  parameter units.Time tDet(fixed = false) "time of detonation" annotation(
    HideResult = false);

initial algorithm
  /*
  r := rInit_par;
  rInit := rInit_par;
  volCoreInit := 4.0/3.0*Modelica.Constants.pi*rInit_par^3.0;
  mCore:= rhoCore*volCoreInit;
  
  */
  
  
initial equation
  r = rInit_par;
  rInit = rInit_par;
  volCoreInit = 4.0/3.0*Modelica.Constants.pi*rInit_par^3.0;
  
//
  mCore = rhoCore*volCoreInit;
  tDet = tDet_par;
  pCore = pCoreInit;
  

  
  /*
  //---
  nNuke = kNnukDen*nInit*(4/3*Modelica.Constants.pi*rInit_par^3);
  n = nNuke/volCore;
//-----
  sigmaF = sigmaF_par;
  sigmaEl = sigmaEl_par;
  gamma = gamma_par;
  nu = nu_par;
//-----
  sigmaT = sigmaF + sigmaEl;
  vNeutron = vNeutron_par;
  volCore = 4.0/3.0*Modelica.Constants.pi*r^3.0;
//
  lambdaCoreFiss = 1.0/(sigmaF*n);
  lambdaCoreTrans = 1.0/(sigmaT*n);
  tau = lambdaCoreFiss/vNeutron;
//-----
  dCore = sqrt((lambdaCoreFiss*lambdaCoreTrans)/(3.0*(-alpha + nu - 1.0)));
  (r/dCore)*1.0/tan(r/dCore) + (3*dCore/(2.0*lambdaCoreTrans))*(r/dCore) - 1.0 = 0.0;
//-----
//-----
  pCore = gamma*Eemit/volCore;
  Eemit_TNTeq = Eemit/(4.184*10^9);
  FissRate = (NcoreInit*volCoreInit/tau)*exp((alpha/tau)*tAfterDet);
  
  
  der(Eemit) = (NcoreInit*volCoreInit*Efiss/tau)*exp((alpha/tau)*tAfterDet);
  der(EkCore) = dVoldt*pCore;
  der(r) = vCoreExp;
  der(volCore) = dVoldt;
  der(vCoreExp) = 4*Modelica.Constants.pi*r^2*gamma*Eemit/(volCore*mCore);
  der(nCumFiss) = FissRate;
  
  mCore = rhoCore*volCore;
  
  */
  
algorithm

equation
  if (time <= tDet) then
    tAfterDet = 0.0;
  else
    tAfterDet = time - tDet;
  end if;
//---
  nNuke = kNnukDen*nInit*(4/3*Modelica.Constants.pi*rInit_par^3);
  
//-----
  sigmaF = sigmaF_par;
  sigmaEl = sigmaEl_par;
  gamma = gamma_par;
  nu = nu_par;
//-----
  sigmaT = sigmaF + sigmaEl;
  vNeutron = vNeutron_par;
  
//
  volCore = 4.0/3.0*Modelica.Constants.pi*r^3.0;
  n = nNuke/volCore;
    
//-----
  if(time<2e-6)then
    lambdaCoreFiss = 1.0/(sigmaF*n);
    lambdaCoreTrans = 1.0/(sigmaT*n);
    tau = lambdaCoreFiss/vNeutron;
    
    dCore = sqrt((lambdaCoreFiss*lambdaCoreTrans)/(3.0*(-alpha + nu - 1.0)));
    (r/dCore)*1.0/tan(r/dCore) + (3*dCore/(2.0*lambdaCoreTrans))*(r/dCore) - 1.0 = 0.0;
    
    pCore = gamma*Eemit/volCore;
    FissRate = (NcoreInit*volCoreInit/tau)*exp((alpha/tau)*tAfterDet);
    
    der(Eemit) = (NcoreInit*volCoreInit*Efiss/tau)*exp((alpha/tau)*tAfterDet);
    der(vCoreExp) = 4*Modelica.Constants.pi*r^2*gamma*Eemit/(volCore*mCore);
  
  else
    lambdaCoreFiss=0;
    lambdaCoreTrans=0;
    tau= 0;
    
    alpha=0;
    dCore=0;
    
    pCore= 0;
    FissRate=0;
    
    der(Eemit) = 0;
    der(vCoreExp) =0;
    
  end if;
//-----
  
  der(EkCore) = dVoldt*pCore;
  der(r) = vCoreExp;
  der(volCore) = dVoldt;
  der(nCumFiss) = FissRate;
  
  Eemit_TNTeq = Eemit/(4.184*10^9);
  
//-----
    
  annotation(
    experiment(StartTime = 0, StopTime = 1e-05, Tolerance = 1e-06, Interval = 1e-08));
end FissionExplosionDeviceCore_ex02;
