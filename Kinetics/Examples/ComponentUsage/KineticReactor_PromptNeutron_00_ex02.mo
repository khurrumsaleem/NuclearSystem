within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_PromptNeutron_00_ex02
  extends Modelica.Icons.Example;
  Components.KineticReactor_PromptNeutron_00 PtRctr annotation(
    Placement(transformation(origin = {93, 16}, extent = {{-15, -15}, {15, 15}})));
  Modelica.Blocks.Sources.Ramp ramp_tgt_pwrRel0(height = 0, duration = 0.001, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {-148, 16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {141, 4}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr1(significantDigits = 4) annotation(
    Placement(transformation(origin = {141, 29}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-123, 16}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Math.Gain ctrlP(k = 1) annotation(
    Placement(transformation(origin = {-73, 16}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Continuous.LimIntegrator ctrlI(outMax = 10, k = 5) annotation(
    Placement(transformation(origin = {-73, -9}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Math.Sum sumCtrl(nin = 3) annotation(
    Placement(transformation(origin = {-42, 16}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Math.Sum sumRho(nin = 2) annotation(
    Placement(transformation(origin = {64, 16}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Continuous.Der der1 annotation(
    Placement(transformation(origin = {-99, -33}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Continuous.FirstOrder delay_sensor(T = 0.01) annotation(
    Placement(transformation(origin = {40, -60}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain ctrlD(k = 0.1) annotation(
    Placement(transformation(origin = {-75, -33}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Sources.Step step_dstrb_keff(height = 0.001, offset = 1, startTime = 2) annotation(
    Placement(transformation(origin = {-24, 56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder actDelay(T = 1) annotation(
    Placement(transformation(origin = {28, 16}, extent = {{-10, -10}, {10, 10}})));
  Utilities.keff2rho keff2rho annotation(
    Placement(transformation(origin = {5, 56}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Math.Gain sig2act(k = 0.0001) annotation(
    Placement(transformation(origin = {3, 16}, extent = {{-7, -7}, {7, 7}})));
  Utilities.rho2keff rho2keff_act annotation(
    Placement(transformation(origin = {56, -10}, extent = {{-6, -6}, {6, 6}})));
equation
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{109.5, 4}, {121, 4}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwr, realValue_pwr1.numberPort) annotation(
    Line(points = {{109.5, 10}, {115, 10}, {115, 29}, {120, 29}}, color = {0, 0, 127}));
  connect(ramp_tgt_pwrRel0.y, feedback.u1) annotation(
    Line(points = {{-137, 16}, {-129, 16}}, color = {0, 0, 127}));
  connect(feedback.y, ctrlP.u) annotation(
    Line(points = {{-116.7, 16}, {-80.7, 16}}, color = {0, 0, 127}));
  connect(feedback.y, ctrlI.u) annotation(
    Line(points = {{-116.7, 16}, {-106.7, 16}, {-106.7, -9}, {-80.7, -9}}, color = {0, 0, 127}));
  connect(ctrlP.y, sumCtrl.u[1]) annotation(
    Line(points = {{-65.3, 16}, {-49.3, 16}}, color = {0, 0, 127}));
  connect(ctrlI.y, sumCtrl.u[2]) annotation(
    Line(points = {{-65.3, -9}, {-59.6, -9}, {-59.6, 16}, {-49.3, 16}}, color = {0, 0, 127}));
  connect(feedback.y, der1.u) annotation(
    Line(points = {{-116.7, 16}, {-112.7, 16}, {-112.7, -33}, {-107.7, -33}}, color = {0, 0, 127}));
  connect(delay_sensor.u, PtRctr.y_pwrRel0) annotation(
    Line(points = {{52, -60}, {114, -60}, {114, 4}, {109.5, 4}}, color = {0, 0, 127}));
  connect(delay_sensor.y, feedback.u2) annotation(
    Line(points = {{29, -60}, {-123, -60}, {-123, 10}}, color = {0, 0, 127}));
  connect(der1.y, ctrlD.u) annotation(
    Line(points = {{-91.3, -33}, {-83.3, -33}}, color = {0, 0, 127}));
  connect(ctrlD.y, sumCtrl.u[3]) annotation(
    Line(points = {{-67.3, -33}, {-54.3, -33}, {-54.3, 16}, {-50.3, 16}}, color = {0, 0, 127}));
  connect(step_dstrb_keff.y, keff2rho.u_keff) annotation(
    Line(points = {{-12, 56}, {-2, 56}}, color = {0, 0, 127}));
  connect(PtRctr.u_rho, sumRho.y) annotation(
    Line(points = {{76.5, 16}, {71, 16}}, color = {0, 0, 127}));
  connect(actDelay.y, sumRho.u[1]) annotation(
    Line(points = {{39, 16}, {57, 16}}, color = {0, 0, 127}));
  connect(keff2rho.y_rho, sumRho.u[2]) annotation(
    Line(points = {{12, 56}, {52, 56}, {52, 16}, {57, 16}}, color = {0, 0, 127}));
  connect(sig2act.y, actDelay.u) annotation(
    Line(points = {{10.7, 16}, {16.4, 16}}, color = {0, 0, 127}));
  connect(sumCtrl.y, sig2act.u) annotation(
    Line(points = {{-35, 16}, {-5, 16}}, color = {0, 0, 127}));
  connect(actDelay.y, rho2keff_act.u_rho) annotation(
    Line(points = {{39, 16}, {44, 16}, {44, -10}, {49, -10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.001),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})));
end KineticReactor_PromptNeutron_00_ex02;
