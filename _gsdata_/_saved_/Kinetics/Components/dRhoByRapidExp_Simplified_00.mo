within NuclearSystem.Kinetics.Components;

model dRhoByRapidExp_Simplified_00
  /*-----------------------------------
            imports
        -----------------------------------*/
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  import conv = NuclearSystem.Constants.UnitConversions;
  /* ---------------------------------------------
                switches
          --------------------------------------------- */
  parameter Types.Switches.switchHowToDetVar switchDetermine_massCore = Types.Switches.switchHowToDetVar.param "switch how to determine massCore" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Types.Switches.switchHowToDetVar switchDetermine_Vol0 = Types.Switches.switchHowToDetVar.param "switch how to determine Vol0" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  /*-----------------------------------
            parameters
        -----------------------------------*/
  parameter units.Volume Vol0_par = 1;
  parameter units.Mass massCore_par = 100;
  /*-----------------------------------
            variables
        -----------------------------------*/
  units.Mass massCore;
  units.Volume Vol;
  units.Length rad;
  units.Velocity drad_dt;
  units.Pressure p;
  units.Energy E;
  /*-----------------------------------
                interfaces
            -----------------------------------*/
  Modelica.Blocks.Interfaces.RealInput u_E(unit = "J") annotation(
    Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_massCore(unit = "kg") if switchDetermine_massCore == Types.Switches.switchHowToDetVar.viaRealInput "massCore input, valid only when switchDetermine_massCore==viaRealInput" annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_Vol0(unit = "m3") if switchDetermine_Vol0 == Types.Switches.switchHowToDetVar.viaRealInput "massCore input, valid only when switchDetermine_massCore==viaRealInput" annotation(
    Placement(transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_Vol(unit = "m3") annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  //**********************************************************************
protected
  parameter units.Volume Vol0(fixed = false) "Vol at t=0" annotation(
    HideResult = false);
  //*********************************************
initial equation
/******************************
  ******************************/
  if switchDetermine_Vol0 == Types.Switches.switchHowToDetVar.param then
    Vol0 = Vol0_par;
  elseif switchDetermine_Vol0 == Types.Switches.switchHowToDetVar.viaRealInput then
    Vol0 = u_Vol0;
  end if;
/******************************
  ******************************/
  Vol = Vol0;
//*********************************************
equation
/******************************
  ******************************/
//---
  if switchDetermine_massCore == Types.Switches.switchHowToDetVar.param then
    massCore = massCore_par;
  elseif switchDetermine_massCore == Types.Switches.switchHowToDetVar.viaRealInput then
    massCore = u_massCore;
  end if;
//---
  E = u_E;
  y_Vol = Vol;
/******************************
  ******************************/
  Vol = 4/3*Modelica.Constants.pi*rad^3;
  p = 2/3*E/Vol;
  der(rad) = drad_dt;
  der(drad_dt) = 1/massCore*(4*Modelica.Constants.pi*rad^2*p);
  annotation(
    defaultComponentName = "CoreExp",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -110}, extent = {{-120, 10}, {120, -10}}, textString = "%name")}));
end dRhoByRapidExp_Simplified_00;