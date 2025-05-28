within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model CoreExpansion_Base
  import units=Modelica.Units.SI;
  import const= Modelica.Constants;
  //------------------------------
  units.Pressure pCore;
  Real gamma;
  units.Energy engy;
  units.Volume VCore;
  units.Length RCore;
  units.Mass Mtotal "mass including tamper";
  units.Velocity vCoreExp "velocity of expansion";
  
  //------------------------------
equation
  pCore= gamma*engy/VCore;
  VCore=4/3*Modelica.Constants.pi*RCore^3;
  //----------
  der(RCore)= vCoreExp;
  der(vCoreExp)= (4*Modelica.Constants.pi*RCore^2*gamma*engy)/(VCore*Mtotal);
  //----------
end CoreExpansion_Base;
