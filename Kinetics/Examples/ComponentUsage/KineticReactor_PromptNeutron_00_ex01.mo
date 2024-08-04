within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_PromptNeutron_00_ex01
  extends Modelica.Icons.Example;
  //----------
  parameter Modelica.Units.SI.Temperature TcontourMin = 0 "";
  parameter Modelica.Units.SI.Temperature TcontourMax = 3000 "";
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_Min = 0.0;
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_Max = 100;
  parameter Real arrowHeatFlowMin = 0.01;
  parameter Real arrowHeatFlowMax = 40;
  //----------
  
  Components.KineticReactor_PromptNeutron_00 PtRctr(use_HeatTransfer = true) annotation(
    Placement(transformation(origin = {-52, 6}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {3, -64}, extent = {{-17, -9}, {17, 9}})));
  Utilities.keff2rho keff2rho annotation(
    Placement(transformation(origin = {-87, 6}, extent = {{-6, -6}, {6, 6}})));
  Modelica.Blocks.Sources.Step step_keff(height = 0.001, offset = 1, startTime = 2) annotation(
    Placement(transformation(origin = {-110, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {90, 6}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {5, -32}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {-15, 6}, extent = {{-5, -5}, {5, 5}})));
  HeatTransferComponents.Common.HeatCapacitorColorT HeatCapacitor(C = (0.444*1000)*1000, T(fixed = true, start = 288.15), switchUnitT = HeatTransferComponents.Types.SwitchUnitVisTemperature.degC, valMax = TcontourMax, valMin = TcontourMin) annotation(
    Placement(transformation(origin = {7, 18}, extent = {{-13, -12}, {13, 12}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {35, 6}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {54, 6}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {68, -20}, extent = {{-9, -6}, {9, 6}})));
  Modelica.Blocks.Sources.Constant const_Gc(k = 100) annotation(
    Placement(transformation(origin = {35, 36}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 TemperatureDegC(valMax = TcontourMax, valMin = TcontourMin) annotation(
    Placement(transformation(origin = {88, 14}, extent = {{-12, -3}, {12, 3}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {-15, -10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 1e-6) annotation(
    Placement(transformation(origin = {54, -10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
equation
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{-31, -6}, {-27, -6}, {-27, -64}, {-17, -64}}, color = {0, 0, 127}));
  connect(keff2rho.y_rho, PtRctr.u_rho) annotation(
    Line(points = {{-80, 6}, {-74.4, 6}}, color = {0, 0, 127}));
  connect(step_keff.y, keff2rho.u_keff) annotation(
    Line(points = {{-99, 6}, {-94, 6}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, HeatCapacitor.port) annotation(
    Line(points = {{-10, 6}, {7, 6}}, color = {191, 0, 0}));
  connect(convection.solid, HeatCapacitor.port) annotation(
    Line(points = {{28, 6}, {7, 6}}, color = {191, 0, 0}));
  connect(convection.fluid, heatFlowSensor1.port_a) annotation(
    Line(points = {{42, 6}, {49, 6}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{80, 6}, {59, 6}}, color = {191, 0, 0}));
  connect(const_Gc.y, convection.Gc) annotation(
    Line(points = {{35, 29}, {35, 13}}, color = {0, 0, 127}));
  connect(fixedTemperature.port, TemperatureDegC.heatPort) annotation(
    Line(points = {{80, 6}, {76, 6}, {76, 14}}, color = {191, 0, 0}));
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{-15, 0.5}, {-15, -5}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{-9, -32}, {-15, -32}, {-15, -14}}, color = {0, 0, 127}));
  connect(heatFlowSensor1.Q_flow, gain1.u) annotation(
    Line(points = {{54, 0.5}, {54, -5}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain1.y) annotation(
    Line(points = {{58, -20}, {54, -20}, {54, -14}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{-32, 6}, {-20, 6}}, color = {191, 0, 0}));
  annotation(
    experiment(StartTime = 0, StopTime = 3, Tolerance = 1e-06, Interval = 0.0001),
    Diagram(graphics = {Text(origin = {2, 39}, extent = {{-24, 7}, {24, -7}}, textString = "heat capacity of 
1.0 ton iron", horizontalAlignment = TextAlignment.Left), Text(origin = {31, -32}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]"), Text(origin = {4, -26}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {1, -58}, extent = {{-19, 12}, {19, 0}}, textString = "Reactor power
relative to initial", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-120, -100}, {100, 100}})));
end KineticReactor_PromptNeutron_00_ex01;
