within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model FissionExplosion_Cor_vCoreExp_01
  extends Modelica.Icons.Example;
  Components.ExtremeFastFission.FissionExplosionDeviceCore00 FissionCore annotation(
    Placement(transformation(origin = {-60, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_vCoreExp_cor(T = 1.2e-7) annotation(
    Placement(transformation(origin = {18, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_vCoreExp_cor(use_reset = false) annotation(
    Placement(transformation(origin = {-34, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_der_r(amplitude = 7.6e6, nperiod = 1, period = 2, startTime = 7e-8, width = 1) annotation(
    Placement(transformation(origin = {52, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_vCoreExp(use_reset = false) annotation(
    Placement(transformation(origin = {-6, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain mps2Mmps_firstOrder_vCoreExp_cor(k = 1e-6) annotation(
    Placement(transformation(origin = {-19, 16}, extent = {{5, -5}, {-5, 5}})));
equation
  connect(firstOrder_vCoreExp_cor.y, integ_vCoreExp_cor.u) annotation(
    Line(points = {{7, -10}, {-22, -10}}, color = {0, 0, 127}));
  connect(firstOrder_vCoreExp_cor.u, pulse_der_r.y) annotation(
    Line(points = {{30, -10}, {41, -10}}, color = {0, 0, 127}));
  connect(FissionCore.y_vCoreExp, integ_vCoreExp.u) annotation(
    Line(points = {{-38, 52}, {-18, 52}}, color = {0, 0, 127}));
  connect(mps2Mmps_firstOrder_vCoreExp_cor.u, firstOrder_vCoreExp_cor.y) annotation(
    Line(points = {{-12, 16}, {-6, 16}, {-6, -10}, {8, -10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1e-6, Tolerance = 1e-06, Interval = 1e-08),
    Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})));
end FissionExplosion_Cor_vCoreExp_01;
