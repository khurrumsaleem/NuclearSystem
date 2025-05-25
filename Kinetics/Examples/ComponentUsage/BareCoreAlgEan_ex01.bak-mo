within NuclearSystem.Kinetics.Examples.ComponentUsage;

model BareCoreAlgEan_ex01
  extends Modelica.Icons.Example;
  Components.ExtremeFastFission.BareCoreAlgEqn_00 CoreAlg0(swCausalAlpha = NuclearSystem.Types.Switches.switch_causal_alpha.alpha2VCore)    annotation(
    Placement(transformation(origin = {-14, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_alpha(duration = 1, height = 0, offset = 0.6, startTime = 1) annotation(
    Placement(transformation(origin = {-63, 74}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denMass(k = 18.71*1000) annotation(
    Placement(transformation(origin = {-63, 30}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.BareCoreAlgEqn_00 CoreAlg1(swCausalAlpha = NuclearSystem.Types.Switches.switch_causal_alpha.VCore2alpha)    annotation(
    Placement(transformation(origin = {-24, -4}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_alpha.y, CoreAlg0.u_alpha) annotation(
    Line(points = {{-52, 74}, {-44, 74}, {-44, 58}, {-25, 58}}, color = {0, 0, 127}));
  connect(const_denMass.y, CoreAlg0.u_denMass) annotation(
    Line(points = {{-52, 30}, {-44, 30}, {-44, 50}, {-25, 50}}, color = {0, 0, 127}));
  connect(CoreAlg1.u_denMass, const_denMass.y) annotation(
    Line(points = {{-35, -6}, {-44, -6}, {-44, 30}, {-52, 30}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_VCore, CoreAlg1.u_VCore) annotation(
    Line(points = {{-2, 56}, {12, 56}, {12, 10}, {-50, 10}, {-50, -10}, {-34, -10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.01));
end BareCoreAlgEan_ex01;
