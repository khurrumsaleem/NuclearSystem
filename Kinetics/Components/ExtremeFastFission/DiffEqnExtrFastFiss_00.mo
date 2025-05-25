within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model DiffEqnExtrFastFiss_00 "Criticality Condition, bare core, extreme fast fissoin"
  extends Kinetics.Components.ExtremeFastFission.BaseClasses.DiffEqnExtremeFastFiss_Base;
  import units = Modelica.Units.SI;
  import conv = NuclearSystem.Constants.UnitConversions;
  
  /******************************
      parameter
    ******************************/
  parameter units.Time t0_par=0;
  parameter Real denNneu0_par=1;
  parameter units.Energy Efiss_par=180*10^6*conv.factor_eV2J();
  parameter units.Velocity vNeutron_par = CmnConsts.vNeuFree_Fission_1MeV;

  /******************************
      Internal objects
    ******************************/
  NuclearSystem.Constants.Common CmnConsts;
  
  /******************************
    interfaces
    ******************************/
  Interface.SinglePortReal port_VCore annotation(
    Placement(transformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, -60}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_lambdaCoreFiss annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-8, -8}, {8, 8}})));
  Interface.SinglePortReal port_alpha annotation(
    Placement(transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 60}, extent = {{-8, -8}, {8, 8}})));
  //**************************************************
  NuclearSystem.Interface.SinglePortReal port_engy annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-8, -8}, {8, 8}})));
equation
  t0=t0_par;
  denNneu0= denNneu0_par;
  Efiss=Efiss_par;
  vNeutron= vNeutron_par;
  //-----
  VCore= port_VCore;
  lambdaCoreFiss= port_lambdaCoreFiss;
  alpha= port_alpha;
  //-----
  port_engy= engy
  //-----
  annotation(
    defaultComponentName = "DiffEqnFiss",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -112}, extent = {{-120, 8}, {120, -8}}, textString = "%name"), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Diff Eqn
Fast Fission")}));
annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Diff Eqn
Fast Fission"), Text(origin = {0, -114}, extent = {{-120, 8}, {120, -8}}, textString = "%name")}),
  Diagram(graphics));
end DiffEqnExtrFastFiss_00;
