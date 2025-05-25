within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model DiffusionAndCriticality_Bare_Base
  import units=Modelica.Units.SI;
  
  /******************************
  variable
  ******************************/
  units.Area sigmaF "";
  units.Area sigmaEl "";
  Real nuNeu;
  
  Real denNNuke "nuke number density";
  Real alpha;
  
  Real lambdaCoreFiss "mean free path for neutrons btwn fissions";
  Real lambdaCoreTrans "transport mean free path for neutrons";
  units.Area sigmaT "transport cross-section";
  
  
  units.Length dCore;
  units.Length RCore;
  
  units.Volume VCore;
  Real Nnuke;
  
equation
  
  sigmaT= sigmaF + sigmaEl;
  lambdaCoreFiss= 1/(sigmaF*denNNuke);
  lambdaCoreTrans= 1/(sigmaT*denNNuke);
  dCore= sqrt((lambdaCoreFiss*lambdaCoreTrans)/(3*(-alpha+nuNeu-1)));
  
  (dCore/RCore)*1.0/tan(dCore/RCore) + (3*RCore/(2*lambdaCoreTrans))*(dCore/RCore) - 1 = 0;
  
  //-----
  VCore= 4/3*Modelica.Constants.pi*RCore^3;
  Nnuke= denNNuke*VCore;
  
  
end DiffusionAndCriticality_Bare_Base;
