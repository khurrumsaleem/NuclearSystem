within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model KineticReactorWithVolumeFeedback_01
  extends Modelica.Icons.Example;
  NuclearSystem.Kinetics.Components.KineticReactor_00 PtRctr(PHI0_par = 1e19, denNnukeFuel_par = 0.95*(18.71*10^6/238)*NuclearSystem.Constants.UnitConversions.factor_mole2num(), switchCausal_PHI0 = NuclearSystem.Types.Switches.switch_causal_neutronFlux.den2PHI, use_u_Vol = true) annotation(
    Placement(transformation(origin = {-43, 4}, extent = {{-17, -17}, {17, 17}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {37, -34}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {17, 4}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {17, -12}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {35, -66}, extent = {{-17, -9}, {17, 9}})));
  Components.dVolByThermalLinearExpansion dVThExp(T0_par(displayUnit = "K")) annotation(
    Placement(transformation(origin = {-50, 50}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = (10400)*(0.3), T(start = 1873.15, fixed = true, displayUnit = "K")) annotation(
    Placement(transformation(origin = {36, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {80, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperature annotation(
    Placement(transformation(origin = {-14, 14}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {-1, 30}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Ramp ramp_rho(height = 0.000670, duration = 1, offset = 0, startTime = 10) annotation(
    Placement(transformation(origin = {-86, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_hconv(duration = 1, height = 0, offset = (5)*(100), startTime = 10) annotation(
    Placement(transformation(origin = {80, 33}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(transformation(origin = {110, 4}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {60, 4}, extent = {{5, -5}, {-5, 5}}, rotation = -0)));
equation
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{-26, 4}, {12, 4}}, color = {191, 0, 0}, thickness = 3));
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{17, -1.5}, {17, -7}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{23.2, -34}, {17, -34}, {17, -16}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{-25, -6}, {3.7, -6}, {3.7, -66.4}, {15.7, -66.4}}, color = {0, 0, 127}));
  connect(PtRctr.heatPort, dVThExp.heatPort) annotation(
    Line(points = {{-26, 4}, {-20, 4}, {-20, 50}, {-40, 50}}, color = {191, 0, 0}));
  connect(heatFlowSensor.port_b, heatCapacitor.port) annotation(
    Line(points = {{22, 4}, {36, 4}}, color = {191, 0, 0}, thickness = 3));
  connect(PtRctr.heatPort, temperature.port) annotation(
    Line(points = {{-26, 4}, {-14, 4}, {-14, 10}}, color = {191, 0, 0}));
  connect(realValue1.numberPort, temperature.T) annotation(
    Line(points = {{-14, 30}, {-14, 18}}, color = {0, 0, 127}));
  connect(ramp_hconv.y, convection.Gc) annotation(
    Line(points = {{80, 27.5}, {80, 13.5}}, color = {0, 0, 127}));
  connect(ramp_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{-74, 4}, {-62, 4}}, color = {0, 0, 127}));
  connect(dVThExp.y_Vol, PtRctr.u_Vol) annotation(
    Line(points = {{-60, 50}, {-66, 50}, {-66, 11}, {-62, 11}}, color = {0, 0, 127}));
  connect(convection.fluid, prescribedHeatFlow.port) annotation(
    Line(points = {{90, 4}, {100, 4}}, color = {191, 0, 0}, thickness = 3));
  connect(PtRctr.y_pwr0, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{-26, 10}, {-8, 10}, {-8, -22}, {120, -22}, {120, 4}}, color = {0, 0, 127}));
  connect(heatCapacitor.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{36, 4}, {56, 4}}, color = {191, 0, 0}, thickness = 3));
  connect(heatFlowSensor1.port_a, convection.solid) annotation(
    Line(points = {{66, 4}, {70, 4}}, color = {191, 0, 0}, thickness = 3));
  annotation(
    Diagram(graphics = {Text(origin = {63, -34}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]"), Text(origin = {36, -28}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {33, -60}, extent = {{-19,