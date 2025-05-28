within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model MassNumberDensityRelation_00
extends Kinetics.Components.ExtremeFastFission.BaseClasses.MassNumberDensityRelation_Base;
  import units = Modelica.Units.SI;
  /******************************
    parameter
  ******************************/
  parameter units.AtomicMassConstant AM_par=235.04 "atomic mass, kg/mole";
  
  /******************************
    Internal objects
    ******************************/
  NuclearSystem.Interface.SinglePortReal port_denNum annotation(
    Placement(transformation(origin = {96, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-8, -8}, {8, 8}})));
  //**************************************************
  NuclearSystem.Interface.SinglePortReal port_denMass annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, -60}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_Vol annotation(
    Placement(transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 60}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_num annotation(
    Placement(transformation(origin = {106, 14}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 40}, extent = {{-8, -8}, {8, 8}})));
  NuclearSystem.Interface.SinglePortReal port_mass annotation(
    Placement(transformation(origin = {116, 24}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, -40}, extent = {{-8, -8}, {8, 8}}))); 
equation
  AM=AM_par;
  //-----
  Vol= port_Vol;
  denMass= port_denMass;
  denNum = port_denNum;
  //-----
  port_mass= mass;
  port_num= num;
  //-----
  annotation(
    defaultComponentName = "DenRelation",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 2}, extent = {{-80, 36}, {80, -36}}, textString = "Mass/Number/Density
Relation"), Text(origin = {0, -114}, extent = {{-120, 8}, {120, -8}}, textString = "%name")}));

end MassNumberDensityRelation_00;
