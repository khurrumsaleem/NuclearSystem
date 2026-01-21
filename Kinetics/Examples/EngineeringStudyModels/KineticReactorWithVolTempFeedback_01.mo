within NuclearSystem.Kinetics.Examples.EngineeringStudyModels;

model KineticReactorWithVolTempFeedback_01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 4) annotation(
    Placement(transformation(origin = {191, 52}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(transformation(origin = {155, 84}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Math.Gain gain(k = 1e-6) annotation(
    Placement(transformation(origin = {165, 62}, extent = {{-4, -4}, {4, 4}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue_pwr(significantDigits = 4) annotation(
    Placement(transformation(origin = {179, 14}, extent = {{-17, -9}, {17, 9}})));
  Kinetics.Components.dVolByThermalLinearExpansion_00 dVThExp(VolRef_par = 1) annotation(
    Placement(transformation(origin = {120, 130}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(transformation(origin = {290, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperature annotation(
    Placement(transformation(origin = {166, 112}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 4) annotation(
    Placement(transformation(origin = {187, 126}, extent = {{-11, -7}, {11, 7}})));
  Modelica.Blocks.Sources.Ramp ramp_rho(duration = 1, height = 1*0.000670, offset = 0, startTime = 500) annotation(
    Placement(transformation(origin = {10, 84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_hconv(duration = 1, height = 0, offset = 130000, startTime = 10) annotation(
    Placement(transformation(origin = {290, 113}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(transformation(origin = {270, 84}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Sources.Ramp ramp_T(duration = 1, height = 0, offset = 900, startTime = 10) annotation(
    Placement(transformation(origin = {350, 84}, extent = {{10, -10}, {-10, 10}})));
  Kinetics.Components.KineticReactor_00 PtRctr(PHI0_par = 1e18, denNnukeFuel_par = (10e3/(270e-3))*Constants.UnitConversions.factor_mole2num(), switchCausal_PHI0 = Types.Switches.switch_causal_neutronFlux.PHI2den, use_u_Vol = true, s_FuelDens_par = 0.95, sigmaF_par = 1.8E-28, v_par = 2000) annotation(
    Placement(transformation(origin = {123, 84}, extent = {{-17, -17}, {17, 17}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 100*700, T(start = 1873.15, fixed = true, displayUnit = "degC"), der_T(fixed = false)) annotation(
    Placement(transformation(origin = {198, 94}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(transformation(origin = {318, 84}, extent = {{10, -10}, {-10, 10}})));
  Components.dRhoByVol_00 dRhoBydVol annotation(
    Placement(transformation(origin = {62, 130}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Math.Sum sum_rho(nin = 3) annotation(
    Placement(transformation(origin = {64, 84}, extent = {{-10, -10}, {10, 10}})));
  Components.dRhoByT_00 dRhoBydT annotation(
    Placement(transformation(origin = {50, 156}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Continuous.Integrator integrator annotation(
    Placement(transformation(origin = {163, 38}, extent = {{-3, -3}, {3, 3}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits = 4) annotation(
    Placement(transformation(origin = {241, 38}, extent = {{-12, -10}, {12, 10}})));
  Utilities.UnitConversions.Jule2tonTNT J2tonTNT annotation(
    Placement(transformation(origin = {213, 25}, extent = {{-7, -7}, {7, 7}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue3(significantDigits = 4) annotation(
    Placement(transformation(origin = {241, 25}, extent = {{-12, -10}, {12, 10}})));
equation
  connect(heatFlowSensor.Q_flow, gain.u) annotation(
    Line(points = {{155, 78.5}, {155, 69.75}, {165, 69.75}, {165, 67}}, color = {0, 0, 127}));
  connect(realValue.numberPort, gain.y) annotation(
    Line(points = {{177, 52}, {165, 52}, {165, 58}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, temperature.T) annotation(
    Line(points = {{174.35, 126}, {166.35, 126}, {166.35, 119}}, color = {0, 0, 127}));
  connect(ramp_hconv.y, convection.Gc) annotation(
    Line(points = {{290, 107.5}, {290, 93.5}}, color = {0, 0, 127}));
  connect(heatFlowSensor1.port_a, convection.solid) annotation(
    Line(points = {{275, 84}, {279, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(PtRctr.heatPort, heatFlowSensor.port_a) annotation(
    Line(points = {{140, 84}, {150, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(PtRctr.y_pwrRel0, realValue_pwr.numberPort) annotation(
    Line(points = {{140.85, 73.8}, {143.85, 73.8}, {143.85, 14}, {159, 14}}, color = {0, 0, 127}));
  connect(dVThExp.y_Vol, PtRctr.u_Vol) annotation(
    Line(points = {{109, 130}, {95, 130}, {95, 90}, {103, 90}}, color = {0, 0, 127}));
  connect(dVThExp.u_T, temperature.T) annotation(
    Line(points = {{131, 130}, {166, 130}, {166, 119}}, color = {0, 0, 127}));
  connect(heatFlowSensor.port_b, heatCapacitor1.port) annotation(
    Line(points = {{160, 84}, {198, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(heatCapacitor1.port, temperature.port) annotation(
    Line(points = {{198, 84}, {166, 84}, {166, 106}}, color = {191, 0, 0}));
  connect(convection.fluid, prescribedTemperature.port) annotation(
    Line(points = {{300, 84}, {308, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(prescribedTemperature.T, ramp_T.y) annotation(
    Line(points = {{330, 84}, {340, 84}}, color = {0, 0, 127}));
  connect(heatCapacitor1.port, heatFlowSensor1.port_b) annotation(
    Line(points = {{198, 84}, {266, 84}}, color = {191, 0, 0}, thickness = 3));
  connect(dRhoBydVol.u_Vol, dVThExp.y_Vol) annotation(
    Line(points = {{74, 130}, {110, 130}}, color = {0, 0, 127}));
  connect(ramp_rho.y, sum_rho.u[1]) annotation(
    Line(points = {{22, 84}, {52, 84}}, color = {0, 0, 127}));
  connect(sum_rho.y, PtRctr.u_rho) annotation(
    Line(points = {{75, 84}, {104, 84}}, color = {0, 0, 127}));
  connect(dRhoBydVol.y_dRho, sum_rho.u[2]) annotation(
    Line(points = {{52, 130}, {42, 130}, {42, 84}, {52, 84}}, color = {0, 0, 127}));
  connect(dRhoBydT.u_T, temperature.T) annotation(
    Line(points = {{62, 156}, {166, 156}, {166, 118}}, color = {0, 0, 127}));
  connect(dRhoBydT.y_dRho, sum_rho.u[3]) annotation(
    Line(points = {{40, 156}, {30, 156}, {30, 84}, {52, 84}}, color = {0, 0, 127}));
  connect(integrator.u, heatFlowSensor.Q_flow) annotation(
    Line(points = {{159, 38}, {155, 38}, {155, 78.5}}, color = {0, 0, 127}));
  connect(integrator.y, realValue2.numberPort) annotation(
    Line(points = {{166, 38}, {227, 38}}, color = {0, 0, 127}));
  connect(integrator.y, J2tonTNT.u_Jule) annotation(
    Line(points = {{166, 38}, {202, 38}, {202, 25}, {205, 25}}, color = {0, 0, 127}));
  connect(J2tonTNT.y_tonTNT, realValue3.numberPort) annotation(
    Line(points = {{221, 25}, {227, 25}}, color = {0, 0, 127}));
  annotation(
    Diagram(graphics = {Text(origin = {215, 54}, extent = {{-11, 4}, {11, -4}}, textString = "[MW]", horizontalAlignment = TextAlignment.Left), Text(origin = {190, 58}, extent = {{-14, 6}, {14, 0}}, textString = "Reactor power", horizontalAlignment = TextAlignment.Left), Text(origin = {177, 20}, extent = {{-19, 12}, {19, 0}}, textString = "Reactor power
relative to initial", horizontalAlignment = TextAlignment.Left), Text(origin = {128, 105}, extent = {{-18, 3}, {18, -3}}, textString = "Point Reactor", horizontalAlignment = TextAlignment.Left), Text(origin = {207, 129}, extent = {{-5, 3}, {5, -3}}, textString = "[K]", horizontalAlignment = TextAlignment.Left), Text(origin = {261, 38}, extent = {{-5, 4}, {5, -4}}, textString = "[J]", horizontalAlignment = TextAlignment.Left), Text(origin = {240, 43}, extent = {{-14, 6}, {14, 0}}, textString = "released energy", horizontalAlignment = TextAlignment.Left), Text(origin = {267, 25}, extent = {{-11, 6}, {11, -6}}, textString = "[tonTNT]", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{0, 0}, {360, 180}})),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 0.1));
end KineticReactorWithVolTempFeedback_01;
