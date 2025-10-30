within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model FissionExplosionCorrelation_01
  extends Modelica.Icons.Example;
  Components.ExtremeFastFission.FissionExplosionDeviceCore00 FissionCore annotation(
    Placement(transformation(origin = {-60, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_pCore_cor(T = 1.3e-8) annotation(
    Placement(transformation(origin = {22, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = 2.95e17, nperiod = 1, period = 2, startTime = 7e-8, width = 1e-7) annotation(
    Placement(transformation(origin = {56, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder_vCoreExp_cor(T = 1.2e-7) annotation(
    Placement(transformation(origin = {24, -50}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_vCoreExp_cor(use_reset = false) annotation(
    Placement(transformation(origin = {-12, -50}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Pulse pulse_der_r(amplitude = 7.6e6, nperiod = 1, period = 2, startTime = 7e-8, width = 1) annotation(
    Placement(transformation(origin = {58, -50}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_pCore_cor(use_reset = false) annotation(
    Placement(transformation(origin = {-16, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator integ_pCore(use_reset = false) annotation(
    Placement(transformation(origin = {-6, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain Pa2PPa_firstOrder_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {-7, 15}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Gain Pa2PPa_integ_pCore_cor(k = 1e-15) annotation(
    Placement(transformation(origin = {-41, -10}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Gain Pa2PPa_integ_pCore(k = 1e-15) annotation(
    Placement(transformation(origin = {21, 80}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Continuous.Integrator integ_vCoreExp(use_reset = false) annotation(
    Placement(transformation(origin = {-6, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Log log annotation(
    Placement(transformation(origin = {-92, -102}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.ContinuousClock continuousClock annotation(
    Placement(transformation(origin = {118, -88}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain k_time(k = 1) annotation(
    Placement(transformation(origin = {-19, -94}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Math.Add add annotation(
    Placement(transformation(origin = {6, -94}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Constant const(k = 1e-7) annotation(
    Placement(transformation(origin = {120, -118}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain k_log(k = 1e6) annotation(
    Placement(transformation(origin = {-115, -102}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Logical.Switch switch1 annotation(
    Placement(transformation(origin = {-58, -102}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Constant const2(k = 1) annotation(
    Placement(transformation(origin = {122, -166}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Logical.GreaterEqual greaterEqual annotation(
    Placement(transformation(origin = {-10, -142}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(transformation(origin = {44, -124}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(pulse_p.y, firstOrder_pCore_cor.u) annotation(
    Line(points = {{45, -10}, {33, -10}}, color = {0, 0, 127}));
  connect(firstOrder_vCoreExp_cor.y, integ_vCoreExp_cor.u) annotation(
    Line(points = {{13, -50}, {0, -50}}, color = {0, 0, 127}));
  connect(firstOrder_vCoreExp_cor.u, pulse_der_r.y) annotation(
    Line(points = {{36, -50}, {47, -50}}, color = {0, 0, 127}));
  connect(firstOrder_pCore_cor.y, integ_pCore_cor.u) annotation(
    Line(points = {{11, -10}, {-4, -10}}, color = {0, 0, 127}));
  connect(FissionCore.y_pCore, integ_pCore.u) annotation(
    Line(points = {{-38, 60}, {-28, 60}, {-28, 80}, {-18, 80}}, color = {0, 0, 127}));
  connect(Pa2PPa_firstOrder_pCore_cor.u, firstOrder_pCore_cor.y) annotation(
    Line(points = {{-1, 15}, {6, 15}, {6, -10}, {12, -10}}, color = {0, 0, 127}));
  connect(integ_pCore_cor.y, Pa2PPa_integ_pCore_cor.u) annotation(
    Line(points = {{-26, -10}, {-34, -10}}, color = {0, 0, 127}));
  connect(integ_pCore.y, Pa2PPa_integ_pCore.u) annotation(
    Line(points = {{5, 80}, {15, 80}}, color = {0, 0, 127}));
  connect(FissionCore.y_vCoreExp, integ_vCoreExp.u) annotation(
    Line(points = {{-38, 52}, {-18, 52}}, color = {0, 0, 127}));
  connect(add.u1, continuousClock.y) annotation(
    Line(points = {{18, -88}, {107, -88}}, color = {0, 0, 127}));
  connect(add.y, k_time.u) annotation(
    Line(points = {{-5, -94}, {-13, -94}}, color = {0, 0, 127}));
  connect(k_log.u, log.y) annotation(
    Line(points = {{-109, -102}, {-103, -102}}, color = {0, 0, 127}));
  connect(const2.y, switch1.u3) annotation(
    Line(points = {{111, -166}, {-40, -166}, {-40, -110}, {-46, -110}}, color = {0, 0, 127}));
  connect(k_time.y, switch1.u1) annotation(
    Line(points = {{-24.5, -94}, {-46, -94}}, color = {0, 0, 127}));
  connect(log.u, switch1.y) annotation(
    Line(points = {{-80, -102}, {-69, -102}}, color = {0, 0, 127}));
  connect(continuousClock.y, greaterEqual.u1) annotation(
    Line(points = {{107, -88}, {74, -88}, {74, -142}, {2, -142}}, color = {0, 0, 127}));
  connect(greaterEqual.y, switch1.u2) annotation(
    Line(points = {{-21, -142}, {-28, -142}, {-28, -102}, {-46, -102}}, color = {255, 0, 255}));
  connect(const.y, add1.u1) annotation(
    Line(points = {{109, -118}, {56, -118}}, color = {0, 0, 127}));
  connect(const2.y, add1.u2) annotation(
    Line(points = {{112, -166}, {102, -166}, {102, -130}, {56, -130}}, color = {0, 0, 127}));
  connect(add1.y, add.u2) annotation(
    Line(points = {{33, -124}, {28, -124}, {28, -100}, {18, -100}}, color = {0, 0, 127}));
  connect(const.y, greaterEqual.u2) annotation(
    Line(points = {{110, -118}, {94, -118}, {94, -150}, {2, -150}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1e-06, Tolerance = 1e-06, Interval = 1.00806e-09),
    Diagram(coordinateSystem(extent = {{-140, -180}, {140, 100}})));
end FissionExplosionCorrelation_01;
