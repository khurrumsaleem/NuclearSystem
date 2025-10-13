within NuclearSystem.Kinetics.Examples.ComponentUsage;

model FissionExplosionDeviceCore00_ex01
  extends Modelica.Icons.Example;
  Components.ExtremeFastFission.FissionExplosionDeviceCore00 FissionCore annotation(
    Placement(transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width = 1e-2, period = 1e-1, startTime = 0) annotation(
    Placement(transformation(origin = {-32, 50}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(booleanPulse.y, FissionCore.u_ignition) annotation(
    Line(points = {{-20, 50}, {-10, 50}, {-10, 32}}, color = {255, 0, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 0.1, Tolerance = 1e-06, Interval = 1e-08));
end FissionExplosionDeviceCore00_ex01;
