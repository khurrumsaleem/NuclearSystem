within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model PtKnt_HighFluxHTGR_withThermalMass_01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {113, 46}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {89, 84}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {89, 68}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {123, 14}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {228, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperature annotation(
    Placement(transformation(origin = {100, 137}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {121, 152}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Ramp ramp_rho(duration = 1, height = 0*0.000670, offset = 0, startTime = 20) annotation(
    Placement(transformation(origin = {10, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_hconv(duration = 1, height = 0, offset = 130000, startTime = 10) annotation(
    Placement(transformation(origin = {228, 113}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_T(duration = 1, height = 0, offset = 900, startTime = 10) annotation(
    Placement(transformation(origin = {290, 84}, extent = {{10, -10}, {-10, 10}})));
  Kinetics.Components.KineticReactor_00 PtRctr(PHI0_par = 1e18, denNnukeFuel_par = (10e3/(270e-3))*Constants.UnitConversions.factor_mole2num(), switchCausal_PHI0 = Types.Switches.switch_causal_neutronFlux.PHI2den, use_u_Vol = false, s_FuelDens_par = 0.95, sigmaF_par = 1.8E-28, v_par = 2000) annotation(
    Placement(transformation(origin = {57, 84}, extent = {{-17, -17}, {17, 17}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 100*700, T(start = 1873.15, displayUnit = "degC")) annotation(
    Placement(transformation(origin = {156, 94}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {183, 84}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(transformation(origin = {260, 84}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{89, 78.5}, {89, 73}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{99.2, 46}, {89.2, 46}, {89.2, 64}, {89.2, 64}}, color = {0, 0, 127}));
  connect(ramp_hconv.y, convection.Gc) annotation(
    Line(points = {{228, 107.5}, {228, 94}}, color = {0, 0, 127}));
  connect(ramp_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{21, 84}, {37, 84}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{74, 84}, {84, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{74.85, 73.8}, {77.85, 73.8}, {77.85, 13.8}, {102.85, 13.8}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, heatCapacitor1.port) annotation(
    Line(points = {{94, 84}, {156, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(heatCapacitor1.port, temperature.port) annotation(
    Line(points = {{156, 84}, {100, 84}, {100, 131}}, color = {191, 0, 0}));
  connect(realValue1.numberPort, temperature.T) annotation(
    Line(points = {{108.35, 152}, {100.35, 152}, {100.35, 144}}, color = {0, 0, 127}));
  connect(heatCapacitor1.port, heatFlowSensor1.port_a) annotation(
    Line(points = {{156, 84}, {178, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(heatFlowSensor1.port_b, convection.solid) annotation(
    Line(points = {{188, 84}, {218, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(convection.fluid, prescribedTemperature.port) annotation(
    Line(points = {{238, 84}, {250, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(prescribedTemperature.T, ramp_T.y) annotation(
    Line(points = {{272, 84}, {279, 84}}, color = {0, 0, 127}));
  annotation(
    Diagram(graphics = {Text(origin = {135, 46}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]"), Text(origin = {112, 52}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {121, 20}, extent = {{-19, 12}, {19, 0}}, textString = "Reactor power
relative to initial", horizontalAlignment = TextAlignment.Left), Text(origin = {62, 105}, extent = {{-18, 3}, {18, -3}}, textString = "Point Reactor", horizontalAlignment = TextAlignment.Left), Text(origin = {141, 153}, extent = {{-5, 3}, {5, -3}}, textString = "[K]", horizontalAlignment = TextAlignment.Left), Text(origin = {155, 121}, extent = {{-37, 9}, {37, -9}}, textString = "thermal mass estimation:
100 kg high enriched fuel inventory
700 J/kg/K specific heat capacity", horizontalAlignment = TextAlignment.Left), Text(origin = {225, 38}, extent = {{-67, 18}, {67, -18}}, textString = "reactor description:
high enrich fuel: 95%
ultra high netron flux design: 1e18 [n/m2/s] (1e14 [n/cm2/s])", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{0, 0}, {340, 180}})),
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.1));
end PtKnt_HighFluxHTGR_withThermalMass_01;
