within NuclearSystem.Kinetics.Components.ExtremeFastFission;

model BareCoreAlgEqn_00
  extends NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses.BareCoreAlgEqn_Base;
  
  //******************************
  import units = Modelica.Units.SI;
  import conv = NuclearSystem.Constants.UnitConversions;
  //************************************************************
  /******************************
    parameter
    ******************************/
  parameter units.Area sigmaF_par = 1.235*conv.factor_Barn2m2() "";
  parameter units.Area sigmaEl_par = 4.566*conv.factor_Barn2m2() "";
  parameter Real nuNeu_par= 2.637;
  parameter units.AtomicMassConstant AM_par=235.04/1000 "atomic mass, kg/mole";
  
  parameter NuclearSystem.Types.Switches.switch_causal_alpha swCausalAlpha= NuclearSystem.Types.Switches.switch_causal_alpha.alpha2VCore;
  
  /******************************
      interfaces
    ******************************/
  Modelica.Blocks.Interfaces.RealInput u_alpha if swCausalAlpha==NuclearSystem.Types.Switches.switch_causal_alpha.alpha2VCore  annotation(
    Placement(transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}})));
  
  Modelica.Blocks.Interfaces.RealInput u_VCore if swCausalAlpha==NuclearSystem.Types.Switches.switch_causal_alpha.VCore2alpha  annotation(
    Placement(transformation(origin = {-120, 10}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}})));
  
  Modelica.Blocks.Interfaces.RealInput u_denMass annotation(
    Placement(transformation(origin = {-98, 50}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}})));
  
  Modelica.Blocks.Interfaces.RealOutput y_VCore if swCausalAlpha==NuclearSystem.Types.Switches.switch_causal_alpha.alpha2VCore  annotation(
    Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_alpha if swCausalAlpha==NuclearSystem.Types.Switches.switch_causal_alpha.VCore2alpha  annotation(
    Placement(transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}})));
  
    //**************************************************
initial equation
  
  //**************************************************
equation
  
  sigmaF= sigmaF_par;
  sigmaEl= sigmaEl_par;
  nuNeu= nuNeu_par;
  AM= AM_par;
  //-----
  
  
  denMass= u_denMass;
  
  //-----
  if(swCausalAlpha==NuclearSystem.Types.Switches.switch_causal_alpha.alpha2VCore)then
    alpha= u_alpha;
    y_VCore= VCore;
  else
    VCore= u_VCore;
    y_alpha= alpha;    
  end if;
  
  
annotation(
    defaultComponentName = "CoreAlg",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Core Alg Eqn
Fast Fission"), Text(origin = {0, -114}, extent = {{-120, 8}, {120, -8}}, textString = "%name")}));
end BareCoreAlgEqn_00;
