within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model dCoreDiffusionRelation_00
  extends NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses.dCoreDiffusionRelation_Base;
  
  import units=Modelica.Units.SI;
  
  
  /******************************
  parameter
  ******************************/
  parameter units.Area sigmaF_par = 1.235*NukeSys_Factors.barn_to_m2 "";
  parameter units.Area sigmaEl_par = 4.566*NukeSys_Factors.barn_to_m2 "";
  parameter Real nuNeu_par= 2.637;
  
  
  /******************************
  Internal objects
  ******************************/
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-12, 60}, extent = {{-10, -10}, {10, 10}})));
  Interface.SinglePortReal port_alpha annotation(
    Placement(transformation(origin = {-118, 6}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 40}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_denNNuke annotation(
    Placement(transformation(origin = {-128, -64}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, -40}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_lambdaCoreTrans annotation(
    Placement(transformation(origin = {128, 8}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 40}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_dCore annotation(
    Placement(transformation(origin = {106, -32}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -40}, extent = {{-8, -8}, {8, 8}})));
  //**************************************************
equation
  
  sigmaF= sigmaF_par;
  sigmaEl= sigmaEl_par;
  nuNeu= nuNeu_par;
//-----
  alpha= port_alpha;
  denNNuke= port_denNNuke;
//-----
  port_dCore= dCore;
  port_lambdaCoreTrans= lambdaCoreTrans;
//-----

annotation(
    defaultComponentName = "dCoreDiffu",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Diffusion
Relation")}));
end dCoreDiffusionRelation_00;
