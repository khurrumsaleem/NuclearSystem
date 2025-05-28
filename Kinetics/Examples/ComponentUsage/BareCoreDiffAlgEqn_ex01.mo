within NuclearSystem.Kinetics.Examples.ComponentUsage;

model BareCoreDiffAlgEqn_ex01
  extends Modelica.Icons.Example;
  //
  parameter Real s_denMass0=1;
  //
  Components.ExtremeFastFission.BareCoreAlgEqn_00 CoreAlg0(swCausalAlpha = Types.Switches.switch_causal_alpha.alpha2VCore, swCausalMass = NuclearSystem.Types.Switches.switch_causal_mass.den2mass) annotation(
    Placement(transformation(origin = {-28, 66}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denMass0(k = s_denMass0* 18.71*1000) annotation(
    Placement(transformation(origin = {-75, 38}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.BareCoreAlgEqn_00 CoreAlg(swCausalAlpha = Types.Switches.switch_causal_alpha.VCore2alpha, swCausalMass = NuclearSystem.Types.Switches.switch_causal_mass.mass2den) annotation(
    Placement(transformation(origin = {24, 12}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.BareCoreDiffEqn_00 CoreDiffEqn(denNneu0_par = 292)  annotation(
    Placement(transformation(origin = {72, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_alpha0(k = 0.9) annotation(
    Placement(transformation(origin = {-75, 72}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(const_denMass0.y, CoreAlg0.u_denMass) annotation(
    Line(points = {{-64, 38}, {-46, 38}, {-46, 68}, {-39, 68}}, color = {0, 0, 127}));
  connect(CoreAlg.y_alpha, CoreDiffEqn.u_alpha) annotation(
    Line(points = {{35, 14}, {61, 14}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_VCore, CoreDiffEqn.u_VCore0) annotation(
    Line(points = {{-17, 72}, {52, 72}, {52, 18}, {61, 18}}, color = {0, 0, 127}));
  connect(CoreAlg.y_lambdaCoreFiss, CoreDiffEqn.u_lambdaCoreFiss) annotation(
    Line(points = {{35, 10}, {61, 10}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_mass, CoreDiffEqn.u_mass) annotation(
    Line(points = {{-17, 60}, {42, 60}, {42, 6}, {61, 6}}, color = {0, 0, 127}));
  connect(CoreDiffEqn.y_VCore, CoreAlg.u_VCore) annotation(
    Line(points = {{83, 12}, {90, 12}, {90, -10}, {2, -10}, {2, 6}, {13, 6}}, color = {0, 0, 127}));
  connect(const_alpha0.y, CoreAlg0.u_alpha) annotation(
    Line(points = {{-64, 72}, {-39, 72}}, color = {0, 0, 127}));
  connect(CoreAlg0.y_mass, CoreAlg.u_mass) annotation(
    Line(points = {{-17, 60}, {0, 60}, {0, 10}, {13, 10}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1.2e-06, Tolerance = 1e-06, Interval = 1.00008e-10));
end BareCoreDiffAlgEqn_ex01;
