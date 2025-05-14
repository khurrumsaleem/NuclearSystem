within NuclearSystem.Kinetics.Examples.ComponentUsage;

model dCoreByDifu_00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const_alpha(k = 0.6) annotation(
    Placement(transformation(origin = {-52, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_n(k = 4.794*10^22*10^6) annotation(
    Placement(transformation(origin = {-52, -16}, extent = {{-10, -10}, {10, 10}})));
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-58, 64}, extent = {{-10, -10}, {10, 10}})));
  Components.dCoreByDifu_00 f_dCore annotation(
    Placement(transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(const_alpha.y, f_dCore.u_alpha) annotation(
    Line(points = {{-40, 20}, {-28, 20}}, color = {0, 0, 127}));
  connect(const_n.y, f_dCore.u_nNuke) annotation(
    Line(points = {{-40, -16}, {-36, -16}, {-36, 12}, {-28, 12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.01));
end dCoreByDifu_00_ex01;
