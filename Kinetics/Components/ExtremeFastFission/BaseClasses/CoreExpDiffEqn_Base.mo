within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model CoreExpDiffEqn_Base
  import units=Modelica.Units.SI;
  import const= Modelica.Constants;
  //-----
  
  //------------------------------
  Modelica.Units.SI.Power rateEngy "J/s";
  
  units.Energy engy;
  
  units.Time t0;
  units.Time delta_t;
  
  units.Volume VCore(start=0.0005);
  units.Volume VCore0(start=0.0005);
  
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
  der(engy)= rateEngy;
  
  pCore= gamma*engy/VCore;
  VCore=4/3*Modelica.Constants.pi*RCore^3;
  //----------
  
  der(RCore)= vCoreExp;
  der(vCoreExp)= (4*Modelica.Constants.pi*RCore^2*gamma*engy)/(VCore*mass);
  //----------
  
end CoreExpDiffEqn_Base;
