within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model BareCoreAlgEqn_Base
  import units=Modelica.Units.SI;
  import const= Modelica.Constants;
  //-----
  
  parameter Real alphaInit=0.6;
  
  //************************************************************
  units.Density denMass "mass density, kg/m3";
  units.AtomicMassConstant AM "atomic mass, kg/mole";
  
  units.Mass mass;
  Real num;
  //-----
  
  units.Area sigmaF "";
  units.Area sigmaEl "";
  Real nuNeu;
  
  Real denNNuke "nuke number density";
  Real alpha(start=alphaInit);
  
  Real lambdaCoreFiss "mean free path for neutrons btwn fissions";
  Real lambdaCoreTrans "transport mean free path for neutrons";
  units.Area sigmaT "transport cross-section";
  
  
  units.Length dCore(start=0.05);
  units.Length RCore(start=0.05);
  
  units.Volume VCore;
  Real Nnuke;
  
  
equation
  
  denNNuke= denMass*const.N_A/AM;
  num= denNNuke*VCore;
  mass= denMass*VCore;
  //-----
  
  sigmaT= sigmaF + sigmaEl;
  lambdaCoreFiss= 1/(sigmaF*denNNuke);
  lambdaCoreTrans= 1/(sigmaT*denNNuke);
  dCore= sqrt((lambdaCoreFiss*lambdaCoreTrans)/(3*(-alpha+nuNeu-1)));
  
  (dCore/RCore)*1.0/tan(dCore/RCore) + (3*RCore/(2*lambdaCoreTrans))*(dCore/RCore) - 1 = 0;
  
  //-----
  VCore= 4/3*Modelica.Constants.pi*RCore^3;
  Nnuke= denNNuke*VCore;
  
  
  
end BareCoreAlgEqn_Base;
