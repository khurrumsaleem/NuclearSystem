within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model DiffusionAndCriticalityBareCore_00 "diffusion relatoin and criticality Condition, bare core, extreme fast fissoin"
  extends Kinetics.Components.ExtremeFastFission.BaseClasses.DiffusionAndCriticality_Bare_Base;
  
  import units = Modelica.Units.SI;
  
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
  
  
  /******************************
      interfaces
    ******************************/
  Interface.SinglePortReal port_dCore annotation(
    Placement(transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 20}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_lambdaCoreTrans annotation(
    Placement(transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 100}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_RCore annotation(
    Placement(transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -20}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_alpha annotation(
    Placement(transformation(origin = {-99, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-99, 40}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_denNNuke annotation(
    Placement(transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-99, -40}, extent = {{-8, -8}, {8, 8}})));
  //**************************************************
  NuclearSystem.Interface.SinglePortReal port_VCore annotation(
    Placement(transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -60}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_Nnuke annotation(
    Placement(transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -100}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_lambdaCoreFiss annotation(
    Placement(transformation(origin = {120, -60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 60}, extent = {{-8, -8}, {8, 8}})));
equation
  sigmaF= sigmaF_par;
  sigmaEl= sigmaEl_par;
  nuNeu= nuNeu_par;
  //-----
  alpha= port_alpha;
  denNNuke= port_denNNuke;
  //-----
  
  //-----
  port_dCore= dCore;
  port_lambdaCoreTrans = lambdaCoreTrans;
  port_lambdaCoreFiss= lambdaCoreFiss;
  
  //-----
  port_RCore = RCore;
  port_VCore= VCore;
  port_Nnuke= Nnuke;
  //-----
  annotation(
    defaultComponentName = "DifAndCri",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -114}, extent = {{-120, 8}, {120, -8}}, textString = "%name"), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Criticality
Condition")}));
end DiffusionAndCriticalityBareCore_00;
