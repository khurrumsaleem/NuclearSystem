within NuclearSystem.Kinetics.Examples.Test;

model KineticReactor_00_test01
  extends Modelica.Icons.Example;
  Components.KineticReactor_00 PtRctr(use_HeatTransfer = true)  annotation(
    Placement(transformation(origin = {24, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step_rho(height = 0.000670, offset = 0, startTime = 10)  annotation(
    Placement(transformation(origin = {-14, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {62, 30}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(step_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-3, 18}, {14, 18}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, fixedTemperature.port) annotation(
    Line(points = {{34, 18}, {46, 18}, {46, 30}, {52, 30}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.002));
end KineticReactor_00_test01;
