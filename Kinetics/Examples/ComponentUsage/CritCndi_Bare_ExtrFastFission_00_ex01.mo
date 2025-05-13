within NuclearSystem.Kinetics.Examples.ComponentUsage;

model CritCndi_Bare_ExtrFastFission_00_ex01
  extends Modelica.Icons.Example;
  
  NuclearSystem.Kinetics.Components.CritCndi_Bare_ExtrFastFission_00 critCndi annotation(
    Placement(transformation(origin = {-10, 16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_Rcore(k = 0.084)  annotation(
    Placement(transformation(origin = {-52, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const_n(k = 0.1811*10^6*NukeSys_Factors.mole2num/0.23504393) annotation(
    Placement(transformation(origin = {-52, -16}, extent = {{-10, -10}, {10, 10}})));
  NuclearSystem.Constants.Factor NukeSys_Factors annotation(
    Placement(transformation(origin = {-58, 64}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(const_Rcore.y, critCndi.u_Rc) annotation(
    Line(points = {{-41, 20}, {-21, 20}}, color = {0, 0, 127}));
  connect(const_n.y, critCndi.u_n) annotation(
    Line(points = {{-41, -16}, {-32, -16}, {-32, 12}, {-21, 12}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.01));
end CritCndi_Bare_ExtrFastFission_00_ex01;
