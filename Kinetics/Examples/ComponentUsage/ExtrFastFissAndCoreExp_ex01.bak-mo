within NuclearSystem.Kinetics.Examples.ComponentUsage;

model ExtrFastFissAndCoreExp_ex01
  extends Modelica.Icons.Example;
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-84, 80}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.DiffusionAndCriticalityBareCore_00 DifAndCri annotation(
    Placement(transformation(origin = {-16, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_alpha(height = 0, duration = 1, offset = 0.6, startTime = 1) annotation(
    Placement(transformation(origin = {-58, 58}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.DiffEqnExtrFastFiss_00 DiffEqnFiss annotation(
    Placement(transformation(origin = {38, 26}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.MassNumberDensityRelation_00 mass annotation(
    Placement(transformation(origin = {-16, -16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denMass(k = 18.71*1000) annotation(
    Placement(transformation(origin = {-62, -38}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_alpha.y, DifAndCri.port_alpha) annotation(
    Line(points = {{-47, 58}, {-40, 58}, {-40, 24}, {-26, 24}}, color = {0, 0, 127}));
  connect(ramp_alpha.y, DiffEqnFiss.port_alpha) annotation(
    Line(points = {{-46, 58}, {2, 58}, {2, 32}, {28, 32}}, color = {0, 0, 127}));
  connect(DiffEqnFiss.port_lambdaCoreFiss, DifAndCri.port_lambdaCoreFiss) annotation(
    Line(points = {{28, 26}, {-6, 26}}));
  connect(DiffEqnFiss.port_VCore, DifAndCri.port_VCore) annotation(
    Line(points = {{28, 20}, {6, 20}, {6, 14}, {-6, 14}}));
  connect(DifAndCri.port_VCore, mass.port_Vol) annotation(
    Line(points = {{-6, 14}, {4, 14}, {4, 2}, {-34, 2}, {-34, -10}, {-26, -10}}));
  connect(const_denMass.y, mass.port_denMass) annotation(
    Line(points = {{-51, -38}, {-38.5, -38}, {-38.5, -22}, {-26, -22}, {-26, -22}}, color = {0, 0, 127}));
  connect(mass.port_denNum, DifAndCri.port_denNNuke) annotation(
    Line(points = {{-26, -16}, {-46, -16}, {-46, 16}, {-26, 16}}));
  annotation(
    experiment(StartTime = 0, StopTime = 1e-06, Tolerance = 1e-06, Interval = 1e-10));
end ExtrFastFissAndCoreExp_ex01;
