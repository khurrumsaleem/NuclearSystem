within NuclearSystem.Kinetics.Examples.ComponentUsage;

model MassNumberDensityRelation_ex01
  extends Modelica.Icons.Example;
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-84, 80}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.MassNumberDensityRelation_00 mass annotation(
    Placement(transformation(origin = {26, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denMass(k = 18.71*1000) annotation(
    Placement(transformation(origin = {-42, -34}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_Vol(k = 4/3*Modelica.Constants.pi*0.05^3) annotation(
    Placement(transformation(origin = {-44, 38}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(const_Vol.y, mass.port_Vol) annotation(
    Line(points = {{-32, 38}, {-8, 38}, {-8, -4}, {16, -4}}, color = {0, 0, 127}));
  connect(const_denMass.y, mass.port_denMass) annotation(
    Line(points = {{-30, -34}, {2, -34}, {2, -16}, {16, -16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1e-06, Tolerance = 1e-06, Interval = 1e-10));
end MassNumberDensityRelation_ex01;
