within NuclearSystem.Kinetics.Examples.ComponentUsage;

model DiffAndCritCndi_Bare_ExtrFastFission_ex01
  extends Modelica.Icons.Example;
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-58, 64}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denNNuke(k = 4.794*10^22*10^6) annotation(
    Placement(transformation(origin = {-58, -30}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.DiffusionAndCriticalityBareCore_00 DifAndCri annotation(
    Placement(transformation(origin = {-16, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_alpha(height = -0.6, duration = 1, offset = 0.6, startTime = 1)  annotation(
    Placement(transformation(origin = {-66, 24}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(const_denNNuke.y, DifAndCri.port_denNNuke) annotation(
    Line(points = {{-47, -30}, {-34, -30}, {-34, 16}, {-26, 16}}, color = {0, 0, 127}));
  connect(ramp_alpha.y, DifAndCri.port_alpha) annotation(
    Line(points = {{-54, 24}, {-26, 24}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 3, Tolerance = 1e-06, Interval = 0.01));
end DiffAndCritCndi_Bare_ExtrFastFission_ex01;
