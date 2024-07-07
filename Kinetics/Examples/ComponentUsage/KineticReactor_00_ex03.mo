within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_00_ex03
  extends Modelica.Icons.Example;
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {88, 8}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_Vol(height = 0.5, duration = 5, offset = 1, startTime = 20)  annotation(
    Placement(transformation(origin = {-52, 46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_der_nNeu(duration = 5, height = 0, offset = 0, startTime = 20) annotation(
    Placement(transformation(origin = {-78, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(transformation(origin = {-44, 8}, extent = {{-10, -8}, {10, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4)  annotation(
    Placement(transformation(origin = {67, -13}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {49, 8}, extent = {{-7, -7}, {7, 7}})));
  Components.KineticReactor_00 PtRctr(use_HeatTransfer = true, use_u_Vol = true)  annotation(
    Placement(transformation(origin = {0, 8}, extent = {{-20, -20}, {20, 20}})));
equation
  connect(ramp_der_nNeu.y, inverseBlockConstraints.u1) annotation(
    Line(points = {{-67, 8}, {-55, 8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor.port_b, fixedTemperature.port) annotation(
    Line(points = {{56, 8}, {78, 8}}, color = {191, 0, 0}));
  connect(heatFlowSensor.Q_flow, realValue.numberPort) annotation(
    Line(points = {{49, 0}, {49, -13}, {53, -13}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.y1, PtRctr.u_rho) annotation(
    Line(points = {{-34, 8}, {-22, 8}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{20, 8}, {42, 8}}, color = {191, 0, 0}));
  connect(ramp_Vol.y, PtRctr.u_Vol) annotation(
    Line(points = {{-40, 46}, {-28, 46}, {-28, 16}, {-22, 16}}, color = {0, 0, 127}));
  connect(PtRctr.y_derNneuqNneu, inverseBlockConstraints.u2) annotation(
    Line(points = {{22, 20}, {32, 20}, {32, -32}, {-52, -32}, {-52, 8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end KineticReactor_00_ex03;
