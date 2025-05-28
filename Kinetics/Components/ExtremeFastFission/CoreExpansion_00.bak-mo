within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model CoreExpansion_00
  extends Kinetics.Components.ExtremeFastFission.BaseClasses.CoreExpansion_Base;
  import units = Modelica.Units.SI;
  import conv = NuclearSystem.Constants.UnitConversions;
  
  /******************************
      parameter
    ******************************/
  Real gamma_par=1/3;

  /******************************
      Internal objects
    ******************************/
  
  /******************************
    interfaces
    ******************************/
  NuclearSystem.Interface.SinglePortReal port_engy annotation(
    Placement(transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, -40}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_VCore annotation(
    Placement(transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -40}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_RCore annotation(
    Placement(transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {99, 40}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_Mtotal annotation(
    Placement(transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 40}, extent = {{-8, -8}, {8, 8}})));

//**************************************************
equation
  gamma= gamma_par;
  //-----
  Mtotal= port_Mtotal;
  engy = port_engy;
  //-----
  VCore= port_VCore;
  RCore= port_RCore;
  //-----
  annotation(
    defaultComponentName = "CoreExp",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {1, 2}, extent = {{-87, 18}, {87, -18}}, textString = "Core Expansion"), Text(origin = {0, -114}, extent = {{-120, 8}, {120, -8}}, textString = "%name")}),
    Diagram(graphics));
end CoreExpansion_00;
