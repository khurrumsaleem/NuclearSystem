within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model FissionExplosion_Cor_p_01
  extends Modelica.Icons.Example;
  Components.ExtremeFastFission.FissionExplosionDeviceCore00 FissionCore annotation(
    Placement(transformation(origin = {-60, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_pCore_cor(T = 1.3e-8) annotation(
    Placement(transformation(origin = {22, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = 2.95e17, nperiod = 1, period = 2, startTime = 7e-8, width = 1e-7) annotation(
    Placement(transformation(origin = {56, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_pCore_cor(use_reset = false) annotation(
    Placement(transformation(origin = {-16, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_pCore(use_reset = false) annotation(
    Placement(transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain Pa2PPa_firstOrder_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {-7, 15}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Gain Pa2PPa_integ_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {-41, -10}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Gain Pa2PPa_integ_pCore(k = 1e-15) annotation(
    Placement(transformation(origin = {27, 60}, extent = {{-5, -5}, {5, 5}})));
equation
  connect(pulse_p.y, firstOrder_pCore_cor.u) annotation(
    Line(points = {{45, -10}, {33, -10}}, color = {0, 0, 127}));
  connect(firstOrder_pCore_cor.y, integ_pCore_cor.u) annotation(
    Line(points = {{11, -10}, {-4, -10}}, color = {0, 0, 127}));
  connect(FissionCore.y_pCore, integ_pCore.u) annotation(
    Line(points = {{-38, 60}, {-12, 60}}, color = {0, 0, 127}));
  connect(Pa2PPa_firstOrder_pCore_cor.u, firstOrder_pCore_cor.y) annotation(
    Line(points = {{-1, 15}, {6, 15}, {6, -10}, {12, -10}}, color = {0, 0, 127}));
  connect(integ_pCore_cor.y, Pa2PPa_integ_pCore_cor.u) annotation(
    Line(points = {{-26, -10}, {-34, -10}}, color = {0, 0, 127}));
  connect(integ_pCore.y, Pa2PPa_integ_pCore.u) annotation(
    Line(points = {{11, 60}, {21, 60}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 0.25e-06, Tolerance = 1e-06, Interval = 1e-09),
    Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})));
end FissionExplosion_Cor_p_01;
