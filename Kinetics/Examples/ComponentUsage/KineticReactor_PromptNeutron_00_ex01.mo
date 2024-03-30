within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_PromptNeutron_00_ex01
  extends Modelica.Icons.Example;
  Components.KineticReactor_PromptNeutron_00 PtRctr(use_HeatTransfer = true)  annotation(
    Placement(transformation(origin = {26, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4)  annotation(
    Placement(transformation(origin = {69, -10}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr1(significantDigits = 4)  annotation(
    Placement(transformation(origin = {69, 11}, extent = {{-17, -9}, {17, 9}})));
  Utilities.keff2rho keff2rho annotation(
    Placement(transformation(origin = {-6, 18}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Sources.Step step_keff(height = 0.001, offset = 1, startTime = 2) annotation(
    Placement(transformation(origin = {-40, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15)  annotation(
    Placement(transformation(origin = {78, 30}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{37, 10}, {43, 10}, {43, -10}, {49, -10}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwr, realValue_pwr1.numberPort) annotation(
    Line(points = {{37, 14}, {44, 14}, {44, 11}, {49, 11}}, color = {0, 0, 127}));
  connect(keff2rho.y_rho, PtRctr.u_rho) annotation(
    Line(points = {{1, 18}, {15, 18}}, color = {0, 0, 127}));
  connect(step_keff.y, keff2rho.u_keff) annotation(
    Line(points = {{-28, 18}, {-13, 18}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, fixedTemperature.port) annotation(
    Line(points = {{36, 18}, {50, 18}, {50, 30}, {68, 30}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 3, Tolerance = 1e-06, Interval = 0.0001));
end KineticReactor_PromptNeutron_00_ex01;
