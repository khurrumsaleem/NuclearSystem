within NuclearSystem.Kinetics.Components;

model ExpandingCoreByEnergyRelease_00

public
  /*-----------------------------------
      imports
  -----------------------------------*/
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  import conv = NuclearSystem.Constants.UnitConversions;
  
  
  
  /* ---------------------------------------------
          switches
    --------------------------------------------- */
  parameter NuclearSystem.Types.Switches.switchHowToDetVar switchDetermine_mCore= NuclearSystem.Types.Switches.switchHowToDetVar.param "switch how to determine mCore" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  parameter NuclearSystem.Types.Switches.switchHowToDetVar switchDetermine_Vol0= NuclearSystem.Types.Switches.switchHowToDetVar.param "switch how to determine Vol0" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  
  
  /*-----------------------------------
      parameters
  -----------------------------------*/
  parameter units.Volume Vol0_par=1;
  parameter units.Mass mCore_par=100;
  
  
  
  /*-----------------------------------
      variables
  -----------------------------------*/
  units.Mass mCore;
  units.Volume Vol;
  units.Length rad;
  units.Velocity drad_dt;
  units.Pressure p;
  units.Energy E;
  
  
  
  /*-----------------------------------
          interfaces
      -----------------------------------*/
  Modelica.Blocks.Interfaces.RealInput u_E annotation(
    Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_mCore if switchDetermine_mCore == NuclearSystem.Types.Switches.switchHowToDetVar.viaRealInput "mCore input, valid only when switchDetermine_mCore==viaRealInput" annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_Vol0 if switchDetermine_Vol0 == NuclearSystem.Types.Switches.switchHowToDetVar.viaRealInput "mCore input, valid only when switchDetermine_mCore==viaRealInput" annotation(
    Placement(transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}})));
  
  
  
  
  //**********************************************************************
protected
  parameter units.Volume Vol0(fixed=false) "Vol at t=0" annotation(HideResult = false);
    
  
  
  //*********************************************
initial equation
  /******************************
  ******************************/
  if switchDetermine_Vol0 == NuclearSystem.Types.Switches.switchHowToDetVar.param then
    Vol0= Vol0_par;
  elseif switchDetermine_Vol0 == NuclearSystem.Types.Switches.switchHowToDetVar.viaRealInput then
    Vol0= u_Vol0;
  end if;
  
  
  
  
  /******************************
  ******************************/
  Vol= Vol0;
  
  
  
  
  //*********************************************
equation
  /******************************
  ******************************/
  //---
  if switchDetermine_mCore == NuclearSystem.Types.Switches.switchHowToDetVar.param then
    mCore= mCore_par;
  elseif switchDetermine_mCore == NuclearSystem.Types.Switches.switchHowToDetVar.viaRealInput then
    mCore= u_mCore;
  end if;
  //---
  
  E=u_E;
  
  
  
  /******************************
  ******************************/
  Vol= 4/3*Modelica.Constants.pi*rad^3;
  p= 2/3*E/Vol;
  
  der(radi)=drad_dt;
  der(drad_dt)= 1/mCore*(4*Modelica.Constants.pi*rad^2*p);
  
  
  
  
annotation(
    defaultComponentName = "CoreExp",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -110}, extent = {{-120, 10}, {120, -10}}, textString = "%name")}));
  
  
  
  
end ExpandingCoreByEnergyRelease_00;