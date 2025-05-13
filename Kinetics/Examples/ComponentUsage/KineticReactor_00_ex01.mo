within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_00_ex01
  extends Modelica.Icons.Example;
  //----------
  parameter Modelica.Units.SI.Temperature TcontourMin = 0 "";
  parameter Modelica.Units.SI.Temperature TcontourMax = 3000 "";
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_Min = 0.0;
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_Max = 100;
  parameter Real arrowHeatFlowMin = 0.01;
  parameter Real arrowHeatFlowMax = 40;
  //----------
  Modelica.Blocks.Sources.Step step_rho(height = 0.000670, offset = 0, startTime = 10) annotation(
    Placement(transformation(origin = {-90, 6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {90, 6}, extent = {{10, -10}, {-10, 10}})));
  Components.KineticReactor_00 PtRctr annotation(
    Placement(transformation(origin = {-51, 6}, extent = {{-17, -17}, {17, 17}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {5, -32}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {-15, 6}, extent = {{-5, -5}, {5, 5}})));
  HeatTransferComponents.Common.HeatCapacitorColorT HeatCapacitor(C = (0.444*1000)*1000, T(start = 288.15, fixed = true), switchUnitT = HeatTransferComponents.Types.SwitchUnitVisTemperature.degC, valMin = TcontourMin, valMax = TcontourMax) annotation(
    Placement(transformation(origin = {10, 16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {60, 6}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {74, -20}, extent = {{-9, -6}, {9, 6}})));
  Modelica.Blocks.Sources.Constant const_Gc(k = 100) annotation(
    Placement(transformation(origin = {36, 36}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 TemperatureDegC(valMin = TcontourMin, valMax = TcontourMax) annotation(
    Placement(transformation(origin = {88, 14}, extent = {{-12, -3}, {12, 3}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {-15, -10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 1e-6) annotation(
    Placement(transformation(origin = {60, -10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {3, -64}, extent = {{-17, -9}, {17, 9}})));
  HeatTransferComponents.Common.ConvectionArrowQflow convection annotation(
    Placement(transformation(origin = {36, 6}, extent = {{-10, -10}, {10, 10}})));

initial equation
  PtRctr.Vol_par=2;
  
  
equation
  connect(step_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-79, 6}, {-70, 6}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{-34, 6}, {-20, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(heatFlowSensor.port_b, HeatCapacitor.port) annotation(
    Line(points = {{-10, 6}, {10, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(fixedTemperature.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{80, 6}, {65, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(fixedTemperature.port, TemperatureDegC.heatPort) annotation(
    Line(points = {{80, 6}, {76, 6}, {76, 14}}, color = {191, 0, 0}));
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{-15, 0.5}, {-15, -5}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{-9, -32}, {-15, -32}, {-15, -14}}, color = {0, 0, 127}));
  connect(heatFlowSensor1.Q_flow, gain1.u) annotation(
    Line(points = {{60, 0.5}, {60, -5}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain1.y) annotation(
    Line(points = {{63.65, -20}, {59.65, -20}, {59.65, -14}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{-33, -4}, {-28, -4}, {-28, -64}, {-16, -64}}, color = {0, 0, 127}));
  connect(const_Gc.y, convection.Gc) annotation(
    Line(points = {{36, 29.4}, {36, 16.4}}, color = {0, 0, 127}));
  connect(HeatCapacitor.port, convection.solid) annotation(
    Line(points = {{10, 6}, {26, 6}}, color = {191, 0, 0}, thickness = 1.5));
  connect(convection.fluid, heatFlowSensor1.port_a) annotation(
    Line(points = {{46, 6}, {56, 6}}, color = {191, 0, 0}, thickness = 1.5));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.002),
    Diagram(graphics = {Text(origin = {2, 39}, extent = {{-24, 7}, {24, -7}}, textString = "heat capacity of 
1.0 ton iron", horizontalAlignment = TextAlignment.Left), Text(origin = {31, -32}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]"), Text(origin = {4, -26}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {1, -58}, extent = {{-19, 12}, {19, 0}}, textString = "Reactor power
relative to initial", horizontalAlignment = TextAlignment.Left), Text(origin = {-54, 31}, extent = {{-24, 7}, {24, -7}}, textString = "Point Reactor", horizontalAlignment = TextAlignment.Left)}));
end KineticReactor_00_ex01;
