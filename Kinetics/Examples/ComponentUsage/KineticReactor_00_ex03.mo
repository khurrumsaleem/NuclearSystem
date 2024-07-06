within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_00_ex03
  extends Modelica.Icons.Example;
  Components.KineticReactor_00 PtRctr(use_HeatTransfer = true, use_u_Vol = true) annotation(
    Placement(transformation(origin = {20, 8}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {74, 8}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_Vol(height = 0.5, duration = 5, offset = 1, startTime = 20)  annotation(
    Placement(transformation(origin = {-38, 46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_der_nNeu(duration = 5, height = 0, offset = 0, startTime = 20) annotation(
    Placement(transformation(origin = {-82, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(transformation(origin = {-44, 8}, extent = {{-10, -8}, {10, 8}})));
equation
  connect(PtRctr.heatPort, fixedTemperature.port) annotation(
    Line(points = {{40, 8}, {64, 8}}, color = {191, 0, 0}));
  connect(ramp_Vol.y, PtRctr.u_Vol) annotation(
    Line(points = {{-26, 46}, {-14, 46}, {-14, 16}, {-2, 16}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.y1, PtRctr.u_rho) annotation(
    Line(points = {{-33.5, 8}, {-2, 8}}, color = {0, 0, 127}));
  connect(ramp_der_nNeu.y, inverseBlockConstraints.u1) annotation(
    Line(points = {{-71, 8}, {-55, 8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(PtRctr.y_derNneuqNneu, inverseBlockConstraints.u2) annotation(
    Line(points = {{42, 20}, {52, 20}, {52, -34}, {-52, -34}, {-52, 8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.001));
end KineticReactor_00_ex03;
