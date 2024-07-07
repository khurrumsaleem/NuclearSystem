within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step_rho(height = 0.000670, offset = 0, startTime = 10) annotation(
    Placement(transformation(origin = {-36, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {70, 6}, extent = {{10, -10}, {-10, 10}})));
  Components.KineticReactor_00 PtRctr annotation(
    Placement(transformation(origin = {0, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {49, -21}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {29, 6}, extent = {{-7, -7}, {7, 7}})));
equation
  connect(step_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-24, 6}, {-10, 6}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{10, 6}, {22, 6}}, color = {191, 0, 0}));
  connect(heatFlowSensor.port_b, fixedTemperature.port) annotation(
    Line(points = {{36, 6}, {60, 6}}, color = {191, 0, 0}));
  connect(realValue.numberPort, heatFlowSensor.Q_flow) annotation(
    Line(points = {{35, -21}, {29, -21}, {29, -2}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.002));
end KineticReactor_00_ex01;
