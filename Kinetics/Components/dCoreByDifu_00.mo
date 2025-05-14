within NuclearSystem.Kinetics.Components;

model dCoreByDifu_00 "figure out dCore by diffusion theory"
  import units=Modelica.Units.SI;
  
  /******************************
  parameter
  ******************************/
  parameter units.Area sigmaF_par = 1.235*NukeSys_Factors.barn_to_m2 "";
  parameter units.Area sigmaEl_par = 4.566*NukeSys_Factors.barn_to_m2 "";
  parameter Real nuNeu_par= 2.637;
  
  /******************************
  variable
  ******************************/
  units.Area sigmaF "";
  units.Area sigmaEl "";
  Real nuNeu;
  
  Real nNuke;
  Real alpha;
  
  Real lambdaCoreFiss "mean free path for neutrons btwn fissions";
  Real lambdaCoreTrans "transport mean free path for neutrons";
  units.Area sigmaT "transport cross-section";
  
  Real dCore;
  
  /******************************
  Internal objects
  ******************************/
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-12, 60}, extent = {{-10, -10}, {10, 10}})));

  
  /******************************
  interfaces
  ******************************/
  Modelica.Blocks.Interfaces.RealInput u_alpha annotation(
    Placement(transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_nNuke "nuclear number density, [num/m3]" annotation(
    Placement(transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_dCore annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}})));
  //**************************************************
  Modelica.Blocks.Interfaces.RealOutput y_lambdaCoreTrans annotation(
    Placement(transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}})));
equation
  sigmaF= sigmaF_par;
  sigmaEl= sigmaEl_par;
  nuNeu= nuNeu_par;
  //-----
  alpha= u_alpha;
  nNuke= u_nNuke;
  //-----
  y_dCore= dCore;
  y_lambdaCoreTrans= lambdaCoreTrans;
  //-----
  sigmaT= sigmaF + sigmaEl;
  lambdaCoreFiss= 1/(sigmaF*nNuke);
  lambdaCoreTrans= 1/(sigmaT*nNuke);
  dCore= sqrt((lambdaCoreFiss*lambdaCoreTrans)/(3*(-alpha+nuNeu-1)));
  
annotation(
    defaultComponentName = "f_dCore",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -112}, extent = {{-120, 8}, {120, -8}}, textString = "%name"), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Diffusion
Eqn")}));
end dCoreByDifu_00;
