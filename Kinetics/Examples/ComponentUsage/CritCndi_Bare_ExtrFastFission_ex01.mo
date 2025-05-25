within NuclearSystem.Kinetics.Examples.ComponentUsage;

model CritCndi_Bare_ExtrFastFission_ex01
  extends Modelica.Icons.Example;
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-58, 64}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_alpha(k = 0.6) annotation(
    Placement(transformation(origin = {-58, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_denNNuke(k = 4.794*10^22*10^6) annotation(
    Placement(transformation(origin = {-58, -12}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.dCoreDiffusionRelation_00 dCoreDiffu annotation(
    Placement(transformation(origin = {-24, 20}, extent = {{-10, -10}, {10, 10}})));
  Components.ExtremeFastFission.CriticalityBareCore_00 Criticality annotation(
    Placement(transformation(origin = {12, 20}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(dCoreDiffu.port_lambdaCoreTrans, Criticality.port_lambdaCoreTrans) annotation(
    Line(points = {{-16, 24}, {2, 24}}));
  connect(dCoreDiffu.port_dCore, Criticality.port_dCore) annotation(
    Line(points = {{-16, 16}, {2, 16}}));
  connect(const_alpha.y, dCoreDiffu.port_alpha) annotation(
    Line(points = {{-46, 24}, {-34, 24}}, color = {0, 0, 127}));
  connect(const_denNNuke.y, dCoreDiffu.port_denNNuke) annotation(
    Line(points = {{-46, -12}, {-40, -12}, {-40, 16}, {-34, 16}}, color = {0, 0, 127}));
  connect(dCoreDiffu.port_lambdaCoreTrans, Criticality.port_lambdaCoreTrans) annotation(
    Line(points = {{-14, 24}, {2, 24}}));
  connect(dCoreDiffu.port_dCore, Criticality.port_dCore) annotation(
    Line(points = {{-14, 16}, {2, 16}}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.01));
end CritCndi_Bare_ExtrFastFission_ex01;
