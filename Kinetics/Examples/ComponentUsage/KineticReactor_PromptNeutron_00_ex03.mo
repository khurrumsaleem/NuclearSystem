within NuclearSystem.Kinetics.Examples.ComponentUsage;

model KineticReactor_PromptNeutron_00_ex03
  extends Modelica.Icons.Example;
  //----------
  //0.05*(19*10^6/238)*NuclearSystem.Constants.UnitConversions.factor_mole2num() "nuclear number density, [num/m3]";
  //1*(18.71*1000)*Modelica.Constants.N_A/(235.4/1000)
  //----------
  parameter Modelica.Units.SI.Temperature TcontourMin = 0 "";
  parameter Modelica.Units.SI.Temperature TcontourMax = 3000 "";
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_Min = 0.0;
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_Max = 100;
  parameter Real arrowHeatFlowMin = 0.01;
  parameter Real arrowHeatFlowMax = 40;
  //----------
  Components.KineticReactor_PromptNeutron_00 PtRctr(use_HeatTransfer = true, denNnukeFuel_par = 4.6e29, s_FuelDens_par = 1, use_u_Vol = true) annotation(
    Placement(transformation(origin = {-60, 6}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {17, -60}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(
    Placement(transformation(origin = {90, 6}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {17, -32}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {-3, 6}, extent = {{-5, -5}, {5, 5}})));
  HeatTransferComponents.Common.HeatCapacitorColorT HeatCapacitor(C = (0.444*1000)*1000, T(fixed = true, start = 288.15), switchUnitT = HeatTransferComponents.Types.SwitchUnitVisTemperature.degC, valMax = TcontourMax, valMin = TcontourMin) annotation(
    Placement(transformation(origin = {17, 18}, extent = {{-13, -12}, {13, 12}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {47, 6}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {66, 6}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {80, -20}, extent = {{-9, -6}, {9, 6}})));
  Modelica.Blocks.Sources.Constant const_Gc(k = 100) annotation(
    Placement(transformation(origin = {47, 46}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 TemperatureDegC(valMax = TcontourMax, valMin = TcontourMin) annotation(
    Placement(transformation(origin = {91, 12}, extent = {{-11, -5}, {11, 5}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {-3, -10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gain1(k = 1e-6) annotation(
    Placement(transformation(origin = {66, -10}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Sources.Pulse pulse_u_rho(amplitude = 0.9, width = 1e-6, period = 1, nperiod = 1, offset = 0, startTime = 1e-9) annotation(
    Placement(transformation(origin = {-108, 6}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.CoreExpDiffEqn_00 CoreExp annotation(
    Placement(transformation(origin = {-72, -60}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Constant const_Vol0(k = 1) annotation(
    Placement(transformation(origin = {-45, -48}, extent = {{6, -6}, {-6, 6}}, rotation = -0)));
equation
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{-39, -6}, {-15, -6}, {-15, -60}, {-3, -60}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, HeatCapacitor.port) annotation(
    Line(points = {{2, 6}, {17, 6}}, color = {191, 0, 0}));
  connect(convection.solid, HeatCapacitor.port) annotation(
    Line(points = {{40, 6}, {17, 6}}, color = {191, 0, 0}));
  connect(convection.fluid, heatFlowSensor1.port_a) annotation(
    Line(points = {{54, 6}, {61, 6}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{80, 6}, {71, 6}}, color = {191, 0, 0}));
  connect(const_Gc.y, convection.Gc) annotation(
    Line(points = {{47, 39.4}, {47, 13.8}}, color = {0, 0, 127}));
  connect(fixedTemperature.port, TemperatureDegC.heatPort) annotation(
    Line(points = {{80, 6}, {80, 12}}, color = {191, 0, 0}));
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{-3, 0.5}, {-3, -5}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{3, -32}, {-3, -32}, {-3, -14}}, color = {0, 0, 127}));
  connect(heatFlowSensor1.Q_flow, gain1.u) annotation(
    Line(points = {{66, 0.5}, {66, -5}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, gain1.y) annotation(
    Line(points = {{69.65, -20}, {65.65, -20}, {65.65, -14}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{-40, 6}, {-8, 6}}, color = {191, 0, 0}));
  connect(pulse_u_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-97, 6}, {-82, 6}}, color = {0, 0, 127}));
  connect(CoreExp.y_VCore, PtRctr.u_Vol) annotation(
    Line(points = {{-83, -60}, {-90, -60}, {-90, 14}, {-82, 14}}, color = {0, 0, 127}));
  connect(CoreExp.u_VCore0, const_Vol0.y) annotation(
    Line(points = {{-61, -54}, {-56.5, -54}, {-56.5, -48}, {-52, -48}}, color = {0, 0, 127}));
  connect(PtRctr.y_massFuel0, CoreExp.u_mass) annotation(
    Line(points = {{-38, -10}, {-28, -10}, {-28, -60}, {-61, -60}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwr, CoreExp.u_rateEngy) annotation(
    Line(points = {{-38, -2}, {-24, -2}, {-24, -66}, {-60, -66}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 2e-06, Tolerance = 1e-06, Interval = 1.0005e-09),
    Diagram(graphics = {Text(origin = {2, 39}, extent = {{-24, 7}, {24, -7}}, textString = "heat capacity of 
1.0 ton iron", horizontalAlignment = TextAlignment.Left), Text(origin = {43, -32}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]"), Text(origin = {4, -26}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {15, -54}, extent = {{-19, 12}, {19, 0}}, textString = "Reactor power
relative to initial", horizontalAlignment = TextAlignment.Left), Text(origin = {-56, 35}, extent = {{-24, 7}, {24, -7}}, textString = "Point Reactor", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-120, -100}, {100, 100}})));
end KineticReactor_PromptNeutron_00_ex03;
