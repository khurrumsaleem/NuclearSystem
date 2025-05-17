within NuclearSystem.Kinetics.Examples.ComponentUsage;

model dCoreByDifu_00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const_alpha(k = 0.6) annotation(
    Placement(transformation(origin = {-52, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denNuke(k = 4.794*10^22*10^6) annotation(
    Placement(transformation(origin = {-52, -16}, extent = {{-10, -10}, {10, 10}})));
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-58, 64}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.dCoreDiffusionRelation_00 dCoreDiffu annotation(
    Placement(transformation(origin = {-14, 10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(const_alpha.y, dCoreDiffu.port_alpha) annotation(
    Line(points = {{-40, 20}, {-36, 20}, {-36, 14}, {-24, 14}}, color = {0, 0, 127}));
  connect(const_denNuke.y, dCoreDiffu.port_denNuke) annotation(
    Line(points = {{-40, -16}, {-30, -16}, {-30, 6}, {-24, 6}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.01));
end dCoreByDifu_00_ex01;
