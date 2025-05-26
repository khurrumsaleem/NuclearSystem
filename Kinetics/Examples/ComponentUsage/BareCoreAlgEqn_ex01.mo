within NuclearSystem.Kinetics.Examples.ComponentUsage;

model BareCoreAlgEqn_ex01
  extends Modelica.Icons.Example;
  Components.ExtremeFastFission.BareCoreAlgEqn_00 CoreAlg0(swCausalAlpha = NuclearSystem.Types.Switches.switch_causal_alpha.alpha2VCore)    annotation(
    Placement(transformation(origin = {-14, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_alpha(duration = 1, height = 0, offset = 0.6, startTime = 1) annotation(
    Placement(transformation(origin = {-77, 56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denMass(k = 18.71*1000) annotation(
    Placement(transformation(origin = {-75, 16}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.BareCoreAlgEqn_00 CoreAlg1(swCausalAlpha = NuclearSystem.Types.Switches.switch_causal_alpha.VCore2alpha, swCausalMass = NuclearSystem.Types.Switches.switch_causal_mass.mass2den)    annotation(
    Placement(transformation(origin = {34, 46}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_alpha.y, CoreAlg0.u_alpha) annotation(
    Line(points = {{-66, 56}, {-25, 56}}, color = {0, 0, 127}));
  connect(const_denMass.y, CoreAlg0.u_denMass) annotation(
    Line(points = {{-64, 16}, {-44, 16}, {-44, 52}, {-25, 52}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_VCore, CoreAlg1.u_VCore) annotation(
    Line(points = {{-3, 56}, {12, 56}, {12, 40}, {23, 40}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_mass, CoreAlg1.u_mass) annotation(
    Line(points = {{-2, 44}, {23, 44}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.01));
end BareCoreAlgEqn_ex01;
