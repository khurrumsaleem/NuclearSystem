within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model BareCoreDiffEqn_Base
  import units=Modelica.Units.SI;
  import const= Modelica.Constants;
  //-----
  
  //------------------------------
  Real rateFiss "d(fission)/dt, fission/s";
  Modelica.Units.SI.Power rateEngy "J/s";
  
  Real nFiss;
  units.Energy engy;
  Real engy_TNTeq;
  
  units.Time t0;
  units.Time delta_t;
  
  units.Time tau;
  Real lambdaCoreFiss "mean free path for neutrons btwn fissions";
  units.Velocity vNeutron;
  Real alpha(start=0.6);
  Real denNneu0 "initial neutron number density";
  units.Volume VCore(start=0.0005);
  units.Volume VCore0(start=0.0005);
  units.Energy Efiss;
  
  //------------------------------
  units.Pressure pCore;
  Real gamma;
  units.Length RCore;
  units.Mass mass "mass including tamper";
  units.Velocity vCoreExp "velocity of expansion";
  
  
  
initial equation
  VCore=VCore0;
  
equation
  
  delta_t= time - t0;
  //----------
  tau = lambdaCoreFiss/vNeutron;
  rateFiss= (denNneu0*VCore0/tau)*exp((alpha/tau)*delta_t);
  rateEngy= (denNneu0*VCore0/tau*Efiss)*exp((alpha/tau)*delta_t);
  
  //----------
  der(nFiss)=rateFiss;
  der(engy)= rateEngy;
  
  //----------
  engy_TNTeq = engy/(4.184*10^9);
  
  //----------
  
  pCore= gamma*engy/VCore;
  VCore=4/3*Modelica.Constants.pi*RCore^3;
  //----------
  
  der(RCore)= vCoreExp;
  der(vCoreExp)= (4*Modelica.Constants.pi*RCore^2*gamma*engy)/(VCore*mass);
  //----------
  
end BareCoreDiffEqn_Base;
