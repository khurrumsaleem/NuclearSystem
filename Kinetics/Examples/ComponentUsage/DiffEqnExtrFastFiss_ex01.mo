within NuclearSystem.Kinetics.Examples.ComponentUsage;

model DiffEqnExtrFastFiss_ex01
  extends Modelica.Icons.Example;
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-84, 80}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.DiffusionAndCriticalityBareCore_00 DifAndCri annotation(
    Placement(transformation(origin = {-16, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_alpha(height = 0, duration = 1, offset = 0.6, startTime = 1)  annotation(
    Placement(transformation(origin = {-70, 58}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.DiffEqnExtrFastFiss_00 DiffEqnFiss annotation(
    Placement(transformation(origin = {20, 26}, extent = {{-10, -10}, {10, 10}})));
  NuclearSystem.Kinetics.Components.ExtremeFastFission.MassNumberDensityRelation_00 mass annotation(
    Placement(transformation(origin = {-7, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denMass(k = 18.71*1000) annotation(
    Placement(transformation(origin = {-70, -22}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_alpha.y, DifAndCri.port_alpha) annotation(
    Line(points = {{-59, 58}, {-40, 58}, {-40, 24}, {-26, 24}}, color = {0, 0, 127}));
  connect(ramp_alpha.y, DiffEqnFiss.port_alpha) annotation(
    Line(points = {{-59, 58}, {2, 58}, {2, 32}, {10, 32}}, color = {0, 0, 127}));
  connect(DiffEqnFiss.port_lambdaCoreFiss, DifAndCri.port_lambdaCoreFiss) annotation(
    Line(points = {{10, 26}, {-6, 26}}));
  connect(DiffEqnFiss.port_VCore, DifAndCri.port_VCore) annotation(
    Line(points = {{10, 20}, {6, 20}, {6, 14}, {-6, 14}}));
  connect(DifAndCri.port_VCore, mass.port_Vol) annotation(
    Line(points = {{-6, 14}, {-2, 14}, {-2, 2}, {-30, 2}, {-30, -10}, {-17, -10}}));
  connect(const_denMass.y, mass.port_denMass) annotation(
    Line(points = {{-59, -22}, {-17, -22}}, color = {0, 0, 127}));
  connect(mass.port_denNum, DifAndCri.port_denNNuke) annotation(
    Line(points = {{-17, -16}, {-44, -16}, {-44, 16}, {-26, 16}}));
  annotation(
    experiment(StartTime = 0, StopTime = 1e-6, Tolerance = 1e-06, Interval = 1e-10));
end DiffEqnExtrFastFiss_ex01;
