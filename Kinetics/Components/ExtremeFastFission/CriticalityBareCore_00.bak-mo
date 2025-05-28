within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model CriticalityBareCore_00 "Criticality Condition, bare core, extreme fast fissoin"
  extends NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses.CriticalityCondition_Bare_Base;
  
  import units = Modelica.Units.SI;
  /******************************
    parameter
  ******************************/
  
  
  /******************************
    Internal objects
  ******************************/
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-12, 60}, extent = {{-10, -10}, {10, 10}})));
  
  
  
  /******************************
  interfaces
  ******************************/
  Interface.SinglePortReal port_dCore annotation(
    Placement(transformation(origin = {-112, 30}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, -40}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_lambdaCoreTrans annotation(
    Placement(transformation(origin = {-122, 26}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 40}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_RCore annotation(
    Placement(transformation(origin = {98, 2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-8, -8}, {8, 8}})));
  
  
  //**************************************************
equation
//-----
  dCore = port_dCore;
  lambdaCoreTrans = port_lambdaCoreTrans;
//-----
  port_RCore = RCore;
//-----
  
  annotation(
    defaultComponentName = "Criticality",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -112}, extent = {{-120, 8}, {120, -8}}, textString = "%name"), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Criticality
Condition")}));
end CriticalityBareCore_00;
