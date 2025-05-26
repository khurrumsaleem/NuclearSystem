within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model BareCoreDiffEqn_00
  extends Kinetics.Components.ExtremeFastFission.BaseClasses.BareCoreDiffEqn_Base;
  //******************************
  import units = Modelica.Units.SI;
  import conv = NuclearSystem.Constants.UnitConversions;
  //************************************************************
  /******************************
          parameter
          ******************************/
  parameter units.Time t0_par=0;
  parameter Real denNneu0_par=1;
  parameter units.Energy Efiss_par=180*10^6*conv.factor_eV2J();
  parameter units.Velocity vNeutron_par = CmnConsts.vNeuFree_Fission_1MeV;
  parameter Real gamma_par=1/3;
  
  /******************************
                Internal objects
            ******************************/
  NuclearSystem.Constants.Common CmnConsts;
  
  
  /******************************
            interfaces
          ******************************/
  Modelica.Blocks.Interfaces.RealInput u_VCore0 annotation(
    Placement(transformation(origin = {-78, 44}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_alpha annotation(
    Placement(transformation(origin = {-68, 54}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_lambdaCoreFiss annotation(
    Placement(transformation(origin = {-58, 64}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_VCore annotation(
    Placement(transformation(origin = {154, 10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  //**************************************************
  Modelica.Blocks.Interfaces.RealInput u_mass annotation(
    Placement(transformation(origin = {-48, 74}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}})));
initial equation
//**************************************************
equation
  
  t0=t0_par;
  denNneu0= denNneu0_par;
  Efiss=Efiss_par;
  vNeutron= vNeutron_par;
  gamma= gamma_par;
//-----
  
  VCore0=u_VCore0;
  alpha= u_alpha;
  lambdaCoreFiss= u_lambdaCoreFiss;
  mass= u_mass;
//-----
  
  y_VCore=VCore;
  
  
  annotation(
    defaultComponentName = "CoreDiffEqn",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, 12}, extent = {{-91, 26}, {91, -26}}, textString = "Core Diff Eqn
Fast Fission"), Text(origin = {0, -114}, extent = {{-120, 8}, {120, -8}}, textString = "%name")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end BareCoreDiffEqn_00;
