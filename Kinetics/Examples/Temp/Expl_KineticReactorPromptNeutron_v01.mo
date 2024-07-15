within NuclearSystem.Kinetics.Examples.Temp;

model Expl_KineticReactorPromptNeutron_v01
  extends Modelica.Icons.Example;
  Components.KineticReactor_PromptNeutron_00 PtRctr(use_HeatTransfer = true, switchInit_derDenNneu = NuclearSystem.Types.Switches.switch_initialization.Free) annotation(
    Placement(transformation(origin = {0, 18}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {55, -30}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr1(significantDigits = 4) annotation(
    Placement(transformation(origin = {55, -19}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Blocks.Sources.Step step_rho(height = 0, offset = 1.2, startTime = 0) annotation(
    Placement(transformation(origin = {-62, 18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {78, 18}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {65, -5}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {45, 18}, extent = {{-7, -7}, {7, 7}})));
equation
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{21, 6}, {25, 6}, {25, -30}, {35, -30}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwr, realValue_pwr1.numberPort) annotation(
    Line(points = {{21, 10}, {28, 10}, {28, -19}, {35, -19}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{20, 18}, {38, 18}}, color = {191, 0, 0}));
  connect(heatFlowSensor.port_b, fixedTemperature.port) annotation(
    Line(points = {{52, 18}, {68, 18}}, color = {191, 0, 0}));
  connect(realValue.numberPort, heatFlowSensor.Q_flow) annotation(
    Line(points = {{51, -5}, {45, -5}, {45, 10}}, color = {0, 0, 127}));
  connect(step_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-50, 18}, {-22, 18}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1e-03, Tolerance = 1e-06, Interval = 1e-07));
end Expl_KineticReactorPromptNeutron_v01;
