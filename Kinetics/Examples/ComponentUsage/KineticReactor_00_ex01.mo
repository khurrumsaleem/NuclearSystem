within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_00_ex01
  extends Modelica.Icons.Example;
  Components.KineticReactor_00 PtRctr(use_HeatTransfer = true) annotation(
    Placement(transformation(origin = {2, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step_rho(height = 0.000670, offset = 0, startTime = 10) annotation(
    Placement(transformation(origin = {-36, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {42, 6}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(step_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-25, 6}, {-8, 6}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, fixedTemperature.port) annotation(
    Line(points = {{12, 6}, {32, 6}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.002));
end KineticReactor_00_ex01;
