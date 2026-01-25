within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model KineticReactor_RapidCoreExpansion_01
  extends Modelica.Icons.Example;
  Kinetics.Components.KineticReactor_00 PtRctr(PHI0_par = 1e18, denNnukeFuel_par = (10e3/(270e-3))*Constants.UnitConversions.factor_mole2num(), switchCausal_PHI0 = Types.Switches.switch_causal_neutronFlux.PHI2den, use_u_Vol = false, s_FuelDens_par = 0.95, sigmaF_par = 1.8E-28, v_par = 200000, denMassFuel_par(displayUnit = "kg/m3") = 1000) annotation(
    Placement(transformation(origin = {122, 84}, extent = {{-17, -17}, {17, 17}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {203, 46}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {181, 84}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {181, 68}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {181, 15}, extent = {{-17, -9}, {17, 9}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 100*700, T(start = 1873.15, fixed = true, displayUnit = "K")) annotation(
    Placement(transformation(origin = {216, 94}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {260, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperature annotation(
    Placement(transformation(origin = {164, 94}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {177, 110}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Ramp ramp_rho(duration = 1, height = 0*0.000670, offset = 0.1, startTime = 10) annotation(
    Placement(transformation(origin = {10, 78}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_hconv(duration = 1, height = 0, offset = (5)*(100), startTime = 10) annotation(
    Placement(transformation(origin = {260, 113}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {240, 84}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T(displayUnit = "K") = 288.15) annotation(
    Placement(transformation(origin = {286, 84}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Continuous.Integrator EnergyReleased annotation(
    Placement(transformation(origin = {152, 124}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Components.ExpandingCoreByEnergyRelease_00 CoreExp(switchDetermine_massCore = NuclearSystem.Types.Switches.switchHowToDetVar.viaRealInput, switchDetermine_Vol0 = NuclearSystem.Types.Switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(transformation(origin = {100, 142}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = PtRctr.Vol_par) annotation(
    Placement(transformation(origin = {130, 136}, extent = {{8, -6}, {-8, 6}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = PtRctr.massFuel) annotation(
    Placement(transformation(origin = {130, 142}, extent = {{8, -6}, {-8, 6}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4) annotation(
    Placement(transformation(origin = {61, 162}, extent = {{12, -10}, {-12, 10}})));
  Utilities.UnitConversions.Jule2tonTNT J2tonTNT annotation(
    Placement(transformation(origin = {165, 143}, extent = {{-5, -5}, {5, 5}})));
  Components.dRhoByRapidExp_Simplified_00 dRhoByRapidExp(switchDetermine_denCore0 = NuclearSystem.Types.Switches.switchHowToDetVar.viaRealInput, switchDetermine_rho0 = NuclearSystem.Types.Switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(transformation(origin = {52, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division denCore annotation(
    Placement(transformation(origin = {55, 120}, extent = {{7, -7}, {-7, 7}})));
  Modelica.Blocks.Logical.LessEqualThreshold reactivityThreshold(threshold = 1e-9) annotation(
    Placement(transformation(origin = {80, 42}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(condition = reactivityThreshold.y == true) annotation(
    Placement(transformation(origin = {98, 27.4}, extent = {{-26, -2.6}, {26, 2.6}})));
equation
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{139, 84}, {176, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{181, 78.5}, {181, 73}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{189.2, 46}, {181.2, 46}, {181.2, 64}}, color = {0, 0, 127}));
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{139.85, 73.8}, {147.4, 73.8}, {147.4, 14.8}, {160.85, 14.8}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, heatCapacitor.port) annotation(
    Line(points = {{186, 84}, {216, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(PtRctr.heatPort, temperature.port) annotation(
    Line(points = {{139, 84}, {164, 84}, {164, 90}}, color = {191, 0, 0}));
  connect(realValue1.numberPort, temperature.T) annotation(
    Line(points = {{164.35, 110}, {164.35, 98}}, color = {0, 0, 127}));
  connect(ramp_hconv.y, convection.Gc) annotation(
    Line(points = {{260, 107.5}, {260, 93.5}}, color = {0, 0, 127}));
  connect(heatCapacitor.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{216, 84}, {236, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(heatFlowSensor1.port_a, convection.solid) annotation(
    Line(points = {{245, 84}, {249, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(convection.fluid, fixedTemperature.port) annotation(
    Line(points = {{270, 84}, {276, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(CoreExp.u_E, EnergyReleased.y) annotation(
    Line(points = {{111, 148}, {152, 148}, {152, 131}}, color = {0, 0, 127}));
  connect(realExpression.y, CoreExp.u_Vol0) annotation(
    Line(points = {{121.2, 136}, {110.2, 136}}, color = {0, 0, 127}));
  connect(realExpression1.y, CoreExp.u_massCore) annotation(
    Line(points = {{121.2, 142}, {110.2, 142}}, color = {0, 0, 127}));
  connect(heatFlowSensor.Q_flow, EnergyReleased.u) annotation(
    Line(points = {{181, 78.5}, {152, 78.5}, {152, 116}}, color = {0, 0, 127}));
  connect(CoreExp.y_Vol, realValue2.numberPort) annotation(
    Line(points = {{89, 142}, {81, 142}, {81, 162}, {75, 162}}, color = {0, 0, 127}));
  connect(J2tonTNT.u_Jule, EnergyReleased.y) annotation(
    Line(points = {{159.5, 143}, {152, 143}, {152, 130}}, color = {0, 0, 127}));
  connect(ramp_rho.y, dRhoByRapidExp.u_rho0) annotation(
    Line(points = {{21, 78}, {41, 78}}, color = {0, 0, 127}));
  connect(realExpression1.y, denCore.u1) annotation(
    Line(points = {{122, 142}, {116, 142}, {116, 124}, {63, 124}}, color = {0, 0, 127}));
  connect(CoreExp.y_Vol, denCore.u2) annotation(
    Line(points = {{90, 142}, {84, 142}, {84, 116}, {63, 116}}, color = {0, 0, 127}));
  connect(denCore.y, dRhoByRapidExp.u_denCore) annotation(
    Line(points = {{47.3, 120}, {32.3, 120}, {32.3, 90}, {41, 90}}, color = {0, 0, 127}));
  connect(denCore.y, dRhoByRapidExp.u_denCore0) annotation(
    Line(points = {{47.3, 120}, {33.3, 120}, {33.3, 84}, {41, 84}}, color = {0, 0, 127}));
  connect(dRhoByRapidExp.y_rho, PtRctr.u_rho) annotation(
    Line(points = {{63, 84}, {104, 84}}, color = {0, 0, 127}));
  connect(dRhoByRapidExp.y_rho, reactivityThreshold.u) annotation(
    Line(points = {{64, 84}, {66, 84}, {66, 42}, {76, 42}}, color = {0, 0, 127}));
  annotation(
    Diagram(graphics = {Text(origin = {229, 46}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]"), Text(origin = {202, 52}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {179, 20}, extent = {{-19, 12}, {19, 0}}, textString = "Reactor power
relative to initial", horizontalAlignment = TextAlignment.Left), Text(origin = {126, 105}, extent = {{-18, 3}, {18, -3}}, textString = "Point Reactor", horizontalAlignment = TextAlignment.Left), Text(origin = {195, 111}, extent = {{-5, 3}, {5, -3}}, textString = "[K]", horizontalAlignment = TextAlignment.Left), Text(origin = {65, 153}, extent = {{-5, 3}, {5, -3}}, textString = "[m3]", horizontalAlignment = TextAlignment.Left), Text(origin = {104, 15}, extent = {{-30, 7}, {30, -7}}, textString = "terminate simulation 
when reactivity gets
lower than certain value.", horizontalAlignment = TextAlignment.Left), Rectangle(origin = {105, 29}, pattern = LinePattern.Dash, extent = {{-37, 25}, {37, -25}})}, coordinateSystem(extent = {{0, 0}, {300, 180}})),
    experiment(StartTime = 0, StopTime = 0.01, Tolerance = 1e-06, Interval = 1e-07));
end KineticReactor_RapidCoreExpansion_01;