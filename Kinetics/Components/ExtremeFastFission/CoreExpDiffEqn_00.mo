within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model CoreExpDiffEqn_00
extends Kinetics.Components.ExtremeFastFission.BaseClasses.CoreExpDiffEqn_Base;
  //******************************
  import units = Modelica.Units.SI;
  import conv = NuclearSystem.Constants.UnitConversions;
  //************************************************************
  /******************************
          parameter
          ******************************/
  parameter units.Time t0_par=0;
  parameter Real gamma_par=1/3;
  
  /******************************
                Internal objects
            ******************************/
  
  
  /******************************
            interfaces
          ******************************/
  Modelica.Blocks.Interfaces.RealInput u_VCore0 annotation(
    Placement(transformation(origin = {-78, 44}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_VCore annotation(
    Placement(transformation(origin = {154, 10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  //**************************************************
  Modelica.Blocks.Interfaces.RealInput u_mass annotation(
    Placement(transformation(origin = {-48, 74}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_rateEngy annotation(
    Placement(transformation(origin = {-38, 84}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}})));
initial equation
//**************************************************
equation
  
  t0=t0_par;
  gamma= gamma_par;
//-----
  rateEngy= u_rateEngy;
  VCore0=u_VCore0;
  mass= u_mass;
//-----
  
  y_VCore=VCore;
  
  
  annotation(
    defaultComponentName = "CoreExp",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-5, 8}, extent = {{-83, 22}, {83, -22}}, textString = "Core Expansion
Diff Eqn"), Text(origin = {0, -114}, extent = {{-120, 8}, {120, -8}}, textString = "%name")}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end CoreExpDiffEqn_00;
