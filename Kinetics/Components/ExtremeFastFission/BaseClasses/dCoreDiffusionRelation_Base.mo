within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model dCoreDiffusionRelation_Base
  import units=Modelica.Units.SI;
  
  /******************************
  variable
  ******************************/
  units.Area sigmaF "";
  units.Area sigmaEl "";
  Real nuNeu;
  
  Real denNuke "nuke number density";
  Real alpha;
  
  Real lambdaCoreFiss "mean free path for neutrons btwn fissions";
  Real lambdaCoreTrans "transport mean free path for neutrons";
  units.Area sigmaT "transport cross-section";
  
  Real dCore;
  
  
  
equation

  sigmaT= sigmaF + sigmaEl;
  lambdaCoreFiss= 1/(sigmaF*denNuke);
  lambdaCoreTrans= 1/(sigmaT*denNuke);
  dCore= sqrt((lambdaCoreFiss*lambdaCoreTrans)/(3*(-alpha+nuNeu-1)));
  

end dCoreDiffusionRelation_Base;
