within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model CriticalityCondition_Bare_Base
  import units=Modelica.Units.SI;
  
  /******************************
  variable
  ******************************/
  Real lambdaCoreTrans;
  units.Length dCore;
  
  units.Length RCore;
  
  
equation
  (dCore/RCore)*1.0/tan(dCore/RCore) + (3*RCore/(2*lambdaCoreTrans))*(dCore/RCore) - 1 = 0;
  
end CriticalityCondition_Bare_Base;
