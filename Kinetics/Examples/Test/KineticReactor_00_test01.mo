within NuclearSystem.Kinetics.Examples.Test;

model KineticReactor_00_test01
  extends Modelica.Icons.Example;
  Components.KineticReactor_00 PtRctr annotation(
    Placement(transformation(origin = {24, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step step_rho(height = 0.001*0.006502, offset = 0.006502, startTime = 100)  annotation(
    Placement(transformation(origin = {-14, 18}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(step_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-3, 18}, {14, 18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 110, Tolerance = 1e-06, Interval = 0.01));
end KineticReactor_00_test01;
