within NuclearSystem.Kinetics.Examples.ComponentUsage;

model CritCndi_Bare_ExtrFastFission_ex01
  extends Modelica.Icons.Example;
  Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-58, 64}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_alpha(k = 0.6) annotation(
    Placement(transformation(origin = {-58, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_n(k = 4.794*10^22*10^6) annotation(
    Placement(transformation(origin = {-58, -12}, extent = {{-10, -10}, {10, 10}})));
  NuclearSystem.Kinetics.Components.dCoreByDifu_00 f_dCore annotation(
    Placement(transformation(origin = {-24, 20}, extent = {{-10, -10}, {10, 10}})));
  Components.RCoreByCrit_Bare_00 f_RCore annotation(
    Placement(transformation(origin = {22, 18}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(const_alpha.y, f_dCore.u_alpha) annotation(
    Line(points = {{-47, 24}, {-35, 24}}, color = {0, 0, 127}));
  connect(const_n.y, f_dCore.u_nNuke) annotation(
    Line(points = {{-47, -12}, {-43, -12}, {-43, 16}, {-35, 16}}, color = {0, 0, 127}));
  connect(f_dCore.y_lambdaCoreTrans, f_RCore.u_lambdaCoreTrans) annotation(
    Line(points = {{-12, 24}, {11, 24}}, color = {0, 0, 127}));
  connect(f_dCore.y_dCore, f_RCore.u_dCore) annotation(
    Line(points = {{-12, 16}, {-8, 16}, {-8, 18}, {11, 18}}, color = {0, 0, 127}));
  connect(const_n.y, f_RCore.u_nNuke) annotation(
    Line(points = {{-46, -12}, {-8, -12}, {-8, 12}, {11, 12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.01));
end CritCndi_Bare_ExtrFastFission_ex01;
