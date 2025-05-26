within NuclearSystem.Kinetics.Examples.ComponentUsage;

model BareCoreDiffEqn_ex01
  extends Modelica.Icons.Example;
  Components.ExtremeFastFission.BareCoreAlgEqn_00 CoreAlg0(swCausalAlpha = Types.Switches.switch_causal_alpha.alpha2VCore) annotation(
    Placement(transformation(origin = {-14, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp ramp_alpha(duration = 1, height = 0, offset = 0.6, startTime = 1) annotation(
    Placement(transformation(origin = {-77, 76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denMass(k = 18.71*1000) annotation(
    Placement(transformation(origin = {-75, 16}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.BareCoreDiffEqn_00 CoreDiffEqn annotation(
    Placement(transformation(origin = {34, 52}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp_alpha.y, CoreAlg0.u_alpha) annotation(
    Line(points = {{-66, 76}, {-45.5, 76}, {-45.5, 56}, {-25, 56}}, color = {0, 0, 127}));
  connect(const_denMass.y, CoreAlg0.u_denMass) annotation(
    Line(points = {{-64, 16}, {-44, 16}, {-44, 52}, {-25, 52}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_VCore, CoreDiffEqn.u_VCore0) annotation(
    Line(points = {{-3, 58}, {23, 58}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_lambdaCoreFiss, CoreDiffEqn.u_lambdaCoreFiss) annotation(
    Line(points = {{-3, 50}, {23, 50}}, color = {0, 0, 127}));
  connect(ramp_alpha.y, CoreDiffEqn.u_alpha) annotation(
    Line(points = {{-66, 76}, {12, 76}, {12, 54}, {23, 54}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_mass, CoreDiffEqn.u_mass) annotation(
    Line(points = {{-3, 46}, {23, 46}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 2e-6, Tolerance = 1e-06, Interval = 1e-10));
end BareCoreDiffEqn_ex01;
