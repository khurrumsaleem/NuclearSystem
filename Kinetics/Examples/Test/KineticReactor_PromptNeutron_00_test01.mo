within NuclearSystem.Kinetics.Examples.Test;

model KineticReactor_PromptNeutron_00_test01
  extends Modelica.Icons.Example;
  Components.KineticReactor_PromptNeutron_00 PtRctr annotation(
    Placement(transformation(origin = {26, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_rho(height = 0.001, duration = 0.01, offset = 0, startTime = 2) annotation(
    Placement(transformation(origin = {-16, 18}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-4, 18}, {16, 18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 3, Tolerance = 1e-06, Interval = 0.0001));
end KineticReactor_PromptNeutron_00_test01;
