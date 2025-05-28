within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model DiffEqnExtremeFastFiss_Base
  import units=Modelica.Units.SI;
  import const= Modelica.Constants;
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
  Real alpha;
  Real denNneu0 "initial neutron number density";
  units.Volume VCore;
  units.Energy Efiss;
  
equation
  delta_t= time - t0;
  //----------
  tau = lambdaCoreFiss/vNeutron;
  rateFiss= (denNneu0*VCore/tau)*exp((alpha/tau)*delta_t);
  rateEngy= (denNneu0*VCore/tau*Efiss)*exp((alpha/tau)*delta_t);
  //----------
  der(nFiss)=rateFiss;
  der(engy)= rateEngy;
  //----------
  engy_TNTeq = engy/(4.184*10^9);
  //----------
end DiffEqnExtremeFastFiss_Base;
