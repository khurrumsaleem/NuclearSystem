within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model KineticReactorWithVolumeFeedback_01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {113, 46}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {89, 84}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {89, 68}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {123, 14}, extent = {{-17, -9}, {17, 9}})));
  NuclearSystem.Kinetics.Components.dVolByThermalLinearExpansion_00 dVThExp(VolRef_par = 1) annotation(
    Placement(transformation(origin = {54, 130}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {200, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperature annotation(
    Placement(transformation(origin = {116, 112}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {137, 126}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Ramp ramp_rho(duration = 1, height = 0*0.000670, offset = 0, startTime = 20) annotation(
    Placement(transformation(origin = {10, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_hconv(duration = 1, height = 0, offset = 130000, startTime = 10) annotation(
    Placement(transformation(origin = {200, 113}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {180, 84}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Sources.Ramp ramp_T(duration = 1, height = 0, offset = 900, startTime = 10) annotation(
    Placement(transformation(origin = {260, 84}, extent = {{10, -10}, {-10, 10}})));
  NuclearSystem.Kinetics.Components.KineticReactor_00 PtRctr(PHI0_par = 1e18, denNnukeFuel_par = (10e3/(270e-3))*Constants.UnitConversions.factor_mole2num(), switchCausal_PHI0 = Types.Switches.switch_causal_neutronFlux.PHI2den, use_u_Vol = true, s_FuelDens_par = 0.95, sigmaF_par = 1.8E-28, v_par = 2000) annotation(
    Placement(transformation(origin = {57, 84}, extent = {{-17, -17}, {17, 17}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 100*700, T(start = 1873.15, fixed = true, displayUnit = "degC")) annotation(
    Placement(transformation(origin = {146, 94}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(transformation(origin = {228, 84}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{89, 78.5}, {89, 73}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{99.2, 46}, {89.2, 46}, {89.2, 64}, {89.2, 64}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, temperature.T) annotation(
    Line(points = {{124.35, 126}, {116.35, 126}, {116.35, 119}, {116, 119}}, color = {0, 0, 127}));
  connect(ramp_hconv.y, convection.Gc) annotation(
    Line(points = {{200, 107.5}, {200, 93.5}}, color = {0, 0, 127}));
  connect(heatFlowSensor1.port_a, convection.solid) annotation(
    Line(points = {{185, 84}, {189, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(ramp_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{21, 84}, {37, 84}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{74, 84}, {84, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{74.85, 73.8}, {77.85, 73.8}, {77.85, 13.8}, {102.85, 13.8}}, color = {0, 0, 127}));
  connect(dVThExp.y_Vol, PtRctr.u_Vol) annotation(
    Line(points = {{43, 130}, {29, 130}, {29, 90}, {37, 90}}, color = {0, 0, 127}));
  connect(dVThExp.u_T, temperature.T) annotation(
    Line(points = {{65, 130}, {116, 130}, {116, 119}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, heatCapacitor1.port) annotation(
    Line(points = {{94, 84}, {146, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(heatCapacitor1.port, temperature.port) annotation(
    Line(points = {{146, 84}, {116, 84}, {116, 106}}, color = {191, 0, 0}));
  connect(prescribedTemperature.T, ramp_T.y) annotation(
    Line(points = {{240, 84}, {250, 84}}, color = {0, 0, 127}));
  connect(convection.fluid, prescribedTemperature.port) annotation(
    Line(points = {{210, 84}, {218, 84}}, color = {191, 0, 0}));
  connect(heatCapacitor1.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{146, 84}, {175, 84}}, color = {191, 0, 0}, thickness = 3));
  annotation(
    Diagram(graphics = {Text(origin = {135, 46}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]"), Text(origin = {112, 52}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {121, 20}, extent = {{-19, 12}, {19, 0}}, textString = "Reactor power
relative to initial", horizontalAlignment = TextAlignment.Left), Text(origin = {62, 105}, extent = {{-18, 3}, {18, -3}}, textString = "Point Reactor", horizontalAlignment = TextAlignment.Left), Text(origin = {157, 129}, extent = {{-5, 3}, {5, -3}}, textString = "[K]", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{0, 0}, {300, 180}})),
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1));
end KineticReactorWithVolumeFeedback_01;
