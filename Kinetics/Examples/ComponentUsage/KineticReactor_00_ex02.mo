within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_00_ex02
  extends Modelica.Icons.Example;
  Components.KineticReactor_00 PtRctr annotation(
    Placement(transformation(origin = {93, 16}, extent = {{-15, -15}, {15, 15}})));
  Modelica.Blocks.Sources.Ramp ramp_tgt_pwrRel0(height = 0, duration = 0.001, offset = 1, startTime = 10) annotation(
    Placement(transformation(origin = {-116, 16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4)  annotation(
    Placement(transformation(origin = {141, 4}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr1(significantDigits = 4)  annotation(
    Placement(transformation(origin = {141, 29}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(transformation(origin = {-86, 16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain ctrlP(k = 0.0001)  annotation(
    Placement(transformation(origin = {-31, 16}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Continuous.LimIntegrator ctrlI(outMax = 10, k = 0.0001)  annotation(
    Placement(transformation(origin = {-31, -9}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Math.Sum sumCtrl(nin = 3)  annotation(
    Placement(transformation(origin = {0, 16}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Math.Sum sumRho(nin = 2)  annotation(
    Placement(transformation(origin = {62, 16}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Continuous.Der der1 annotation(
    Placement(transformation(origin = {-57, -33}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Continuous.FirstOrder delay_sensor(T = 0.01)  annotation(
    Placement(transformation(origin = {40, -60}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Math.Gain ctrlD(k = 0.0001) annotation(
    Placement(transformation(origin = {-33, -33}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Sources.Step step_dstrb_keff(height = 0.001, offset = 1, startTime = 2) annotation(
    Placement(transformation(origin = {-24, 56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder actuator(T = 0.1)  annotation(
    Placement(transformation(origin = {26, 16}, extent = {{-10, -10}, {10, 10}})));
  Utilities.keff2rho keff2rho annotation(
    Placement(transformation(origin = {5, 56}, extent = {{-7, -7}, {7, 7}})));
equation
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{109.5, 4}, {121, 4}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwr, realValue_pwr1.numberPort) annotation(
    Line(points = {{109.5, 10}, {115, 10}, {115, 29}, {120, 29}}, color = {0, 0, 127}));
  connect(ramp_tgt_pwrRel0.y, feedback.u1) annotation(
    Line(points = {{-105, 16}, {-95, 16}}, color = {0, 0, 127}));
  connect(feedback.y, ctrlP.u) annotation(
    Line(points = {{-77, 16}, {-39, 16}}, color = {0, 0, 127}));
  connect(feedback.y, ctrlI.u) annotation(
    Line(points = {{-77, 16}, {-65, 16}, {-65, -9}, {-39, -9}}, color = {0, 0, 127}));
  connect(ctrlP.y, sumCtrl.u[1]) annotation(
    Line(points = {{-23.3, 16}, {-7.3, 16}}, color = {0, 0, 127}));
  connect(ctrlI.y, sumCtrl.u[2]) annotation(
    Line(points = {{-23.3, -9}, {-17.6, -9}, {-17.6, 16}, {-7.3, 16}}, color = {0, 0, 127}));
  connect(feedback.y, der1.u) annotation(
    Line(points = {{-77, 16}, {-71, 16}, {-71, -33}, {-66, -33}}, color = {0, 0, 127}));
  connect(delay_sensor.u, PtRctr.y_pwrRel0) annotation(
    Line(points = {{52, -60}, {114, -60}, {114, 4}, {109.5, 4}}, color = {0, 0, 127}));
  connect(delay_sensor.y, feedback.u2) annotation(
    Line(points = {{29, -60}, {-86, -60}, {-86, 8}}, color = {0, 0, 127}));
  connect(der1.y, ctrlD.u) annotation(
    Line(points = {{-49.3, -33}, {-41.3, -33}}, color = {0, 0, 127}));
  connect(ctrlD.y, sumCtrl.u[3]) annotation(
    Line(points = {{-25.3, -33}, {-12.3, -33}, {-12.3, 16}, {-8.3, 16}}, color = {0, 0, 127}));
  connect(step_dstrb_keff.y, keff2rho.u_keff) annotation(
    Line(points = {{-12, 56}, {-2, 56}}, color = {0, 0, 127}));
  connect(PtRctr.u_rho, sumRho.y) annotation(
    Line(points = {{76.5, 16}, {69, 16}}, color = {0, 0, 127}));
  connect(sumCtrl.y, actuator.u) annotation(
    Line(points = {{6, 16}, {14, 16}}, color = {0, 0, 127}));
  connect(actuator.y, sumRho.u[1]) annotation(
    Line(points = {{38, 16}, {54, 16}}, color = {0, 0, 127}));
  connect(keff2rho.y_rho, sumRho.u[2]) annotation(
    Line(points = {{12, 56}, {46, 56}, {46, 16}, {54, 16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.002),
  Diagram(coordinateSystem(extent = {{-140, -100}, {160, 100}})));
end KineticReactor_00_ex02;
