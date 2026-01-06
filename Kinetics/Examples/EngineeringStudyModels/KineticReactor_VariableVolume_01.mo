within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model KineticReactor_VariableVolume_01
  extends Modelica.Icons.Example;
  Kinetics.Components.KineticReactor_00 PtRctr(PHI0_par = 1e19, denNnukeFuel_par = 0.95*(18.71*10^6/238)*Constants.UnitConversions.factor_mole2num(), switchCausal_PHI0 = Types.Switches.switch_causal_neutronFlux.den2PHI, use_u_Vol = true) annotation(
    Placement(transformation(origin = {101, 84}, extent = {{-17, -17}, {17, 17}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {181, 46}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {161, 84}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {161, 68}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {179, 14}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = (10400)*(0.3), T(displayUnit = "K", fixed = true, start = 1873.15)) annotation(
    Placement(transformation(origin = {180, 94}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {224, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperature annotation(
    Placement(transformation(origin = {130, 94}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {143, 110}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Ramp ramp_rho(duration = 1, height = 0*0.000670, offset = 0, startTime = 10) annotation(
    Placement(transformation(origin = {58, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_hconv(duration = 1, height = 0, offset = (5)*(100), startTime = 10) annotation(
    Placement(transformation(origin = {224, 113}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {204, 84}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Sources.Ramp ramp_rho1(duration = 1, height = 1, offset = 1, startTime = 5) annotation(
    Placement(transformation(origin = {54, 122}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T(displayUnit = "K") = 288.15)  annotation(
    Placement(transformation(origin = {250, 84}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{118, 84}, {156, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{161, 78.5}, {161, 73}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{167.2, 46}, {161, 46}, {161, 64}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{118.85, 73.8}, {147.55, 73.8}, {147.55, 13.4}, {159.55, 13.4}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, heatCapacitor.port) annotation(
    Line(points = {{166, 84}, {180, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(PtRctr.heatPort, temperature.port) annotation(
    Line(points = {{118, 84}, {130, 84}, {130, 90}}, color = {191, 0, 0}));
  connect(realValue1.numberPort, temperature.T) annotation(
    Line(points = {{130.35, 110}, {130.35, 98}}, color = {0, 0, 127}));
  connect(ramp_hconv.y, convection.Gc) annotation(
    Line(points = {{224, 107.5}, {224, 93.5}}, color = {0, 0, 127}));
  connect(ramp_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{69, 84}, {81, 84}}, color = {0, 0, 127}));
  connect(heatCapacitor.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{180, 84}, {200, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(heatFlowSensor1.port_a, convection.solid) annotation(
    Line(points = {{209, 84}, {213, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(ramp_rho1.y, PtRctr.u_Vol) annotation(
    Line(points = {{65, 122}, {73, 122}, {73, 91}, {81, 91}}, color = {0, 0, 127}));
  connect(convection.fluid, fixedTemperature.port) annotation(
    Line(points = {{234, 84}, {240, 84}}, color = {191, 0, 0}, thickness = 3));
  annotation(
    Diagram(graphics = {Text(origin = {207, 46}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]"), Text(origin = {180, 52}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {177, 20}, extent = {{-19, 12}, {19, 0}}, textString = "Reactor power
relative to initial", horizontalAlignment = TextAlignment.Left), Text(origin = {102, 105}, extent = {{-18, 3}, {18, -3}}, textString = "Point Reactor", horizontalAlignment = TextAlignment.Left), Text(origin = {161, 111}, extent = {{-5, 3}, {5, -3}}, textString = "[K]", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{0, 0}, {300, 180}})),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.01));
end KineticReactor_VariableVolume_01;