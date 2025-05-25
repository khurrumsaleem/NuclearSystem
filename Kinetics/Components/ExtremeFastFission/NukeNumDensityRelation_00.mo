within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model NukeNumDensityRelation_00
  extends Kinetics.Components.ExtremeFastFission.BaseClasses.NukeNumDensityRelation_Base;
  import units = Modelica.Units.SI;
  /******************************
    parameter
  ******************************/
  parameter units.AtomicMassConstant AM_par "atomic mass, kg/mole";
  
  /******************************
    Internal objects
    ******************************/
  Interface.SinglePortReal port_denNum annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-8, -8}, {8, 8}})));
  //**************************************************
  NuclearSystem.Interface.SinglePortReal port_denMass annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-8, -8}, {8, 8}})));
equation
  AM=AM_par;
  //-----
  denM= port_denMass;
  //-----
  port_denNum= denNum;
  //-----
  annotation(
    defaultComponentName = "denN",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Nuke Num
Relation")}));
end NukeNumDensityRelation_00;
