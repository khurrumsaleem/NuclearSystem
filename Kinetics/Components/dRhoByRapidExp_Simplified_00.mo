within NuclearSystem.Kinetics.Components;

model dRhoByRapidExp_Simplified_00

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
  parameter Types.Switches.switchHowToDetVar switchDetermine_denCore0 = Types.Switches.switchHowToDetVar.param "switch how to determine core density" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Types.Switches.switchHowToDetVar switchDetermine_rho0 = Types.Switches.switchHowToDetVar.param "switch how to determine rho0" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  
  /*-----------------------------------
            parameters
        -----------------------------------*/
  parameter units.Density denCore0_par = 18710 "";
  parameter units.Reactivity rho0_par = 0.1 "";
  
  
  
  /*-----------------------------------
            variables
        -----------------------------------*/
  units.Density denCore;
  units.Reactivity rho;
  
  
  /*-----------------------------------
                interfaces
            -----------------------------------*/
  Modelica.Blocks.Interfaces.RealInput u_denCore(unit = "kg/m3") annotation(
    Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_denCore0(unit = "kg/m3") if switchDetermine_denCore0 == Types.Switches.switchHowToDetVar.viaRealInput "massCore input, valid only when switchDetermine_massCore==viaRealInput" annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_rho0 if switchDetermine_rho0 == Types.Switches.switchHowToDetVar.viaRealInput "massCore input, valid only when switchDetermine_massCore==viaRealInput" annotation(
    Placement(transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_rho annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));



  //**********************************************************************
protected
  parameter units.Density denCore0(fixed = false) "core mass density at t=0" annotation(
    HideResult = false);
  
  parameter units.Reactivity rho0(fixed = false) "reactivity at t=0" annotation(
    HideResult = false);
  
  
  
  //*********************************************
initial equation
/******************************
  ******************************/
  if switchDetermine_denCore0 == Types.Switches.switchHowToDetVar.param then
    denCore0 = denCore0_par;
  elseif switchDetermine_denCore0 == Types.Switches.switchHowToDetVar.viaRealInput then
    denCore0 = u_denCore0;
  end if;
  //---
  if switchDetermine_rho0 == Types.Switches.switchHowToDetVar.param then
    rho0 = rho0_par;
  elseif switchDetermine_rho0 == Types.Switches.switchHowToDetVar.viaRealInput then
    rho0 = u_rho0;
  end if;
  //---
  
  
  
/******************************
  ******************************/
  denCore = denCore0;
  



//*********************************************
equation
/******************************
  ******************************/
  denCore = u_denCore;
  y_rho = rho;



/******************************
  ******************************/
  rho= rho0*denCore/denCore0;
  
  
  
  annotation(
    defaultComponentName = "dRhoByRapidExp",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -110}, extent = {{-120, 10}, {120, -10}}, textString = "%name")}));



end dRhoByRapidExp_Simplified_00;