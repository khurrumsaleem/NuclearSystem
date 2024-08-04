within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_PromptNeutron_00_varVol_ex01
  extends Modelica.Icons.Example;
  Components.KineticReactor_PromptNeutron_00 PtRctr(use_HeatTransfer = true, use_u_Vol = true)  annotation(
    Placement(transformation(origin = {0, 30}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4)  annotation(
    Placement(transformation(origin = {59, -20}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr1(significantDigits = 4)  annotation(
    Placement(transformation(origin = {59, -9}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15)  annotation(
    Placement(transformation(origin = {78, 30}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_Vol(duration = 5, height = 0.5, offset = 1, startTime = 20) annotation(
    Placement(transformation(origin = {-52, 66}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_derNneuqNneu_tgt(duration = 5, height = 0, offset = 0, startTime = 20) annotation(
    Placement(transformation(origin = {-78, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(
    Placement(transformation(origin = {-44, 30}, extent = {{-10, -8}, {10, 8}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {65, 7}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {45, 30}, extent = {{-7, -7}, {7, 7}})));
equation
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{21, 18}, {29, 18}, {29, -20}, {39, -20}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwr, realValue_pwr1.numberPort) annotation(
    Line(points = {{21, 22}, {32, 22}, {32, -9}, {39, -9}}, color = {0, 0, 127}));
  connect(ramp_derNneuqNneu_tgt.y, inverseBlockConstraints.u1) annotation(
    Line(points = {{-67, 30}, {-55, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_Vol.y, PtRctr.u_Vol) annotation(
    Line(points = {{-40, 66}, {-28, 66}, {-28, 38}, {-22, 38}}, color = {0, 0, 127}));
  connect(inverseBlockConstraints.y1, PtRctr.u_rho) annotation(
    Line(points = {{-33.5, 30}, {-22, 30}}, color = {0, 0, 127}));
  connect(PtRctr.y_derNneuqNneu, inverseBlockConstraints.u2) annotation(
    Line(points = {{22, 42}, {26, 42}, {26, -6}, {-52, -6}, {-52, 30}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{20, 30}, {38, 30}}, color = {191, 0, 0}));
  connect(heatFlowSensor.port_b, fixedTemperature.port) annotation(
    Line(points = {{52, 30}, {68, 30}}, color = {191, 0, 0}));
  connect(realValue.numberPort, heatFlowSensor.Q_flow) annotation(
    Line(points = {{51, 7}, {45, 7}, {45, 22}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end KineticReactor_PromptNeutron_00_varVol_ex01;
