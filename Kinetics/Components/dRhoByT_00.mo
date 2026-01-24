within NuclearSystem.Kinetics.Components;

block dRhoByT_00

  /*-----------------------------------
      imports
  -----------------------------------*/
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  import conv = NuclearSystem.Constants.UnitConversions;
  
  
  
  /*-----------------------------------
      parameters
  -----------------------------------*/
  parameter units.Temperature Tref_par=1873.15;
  parameter units.Reactivity alphaT_par=-2e-5;
  
  
  
  
  /*-----------------------------------
      variables
  -----------------------------------*/
  units.Temperature Tref(start=Tref_par);
  units.Reactivity alphaT(start=alphaT_par);
  units.Temperature T(start=0);
  units.Temperature dT(start=0);
  units.Reactivity dRho(start=0);
  
  
  
  /*-----------------------------------
          interfaces
  -----------------------------------*/
  Modelica.Blocks.Interfaces.RealOutput y_dRho annotation(
    Placement(transformation(origin = {110, -1}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_T(unit="K") annotation(
    Placement(transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));

  //*********************************************
initial equation
  /******************************
  ******************************/
  
  
  
  //*********************************************
algorithm
  
  
  
  //*********************************************
equation
  /******************************
  ******************************/
  alphaT=alphaT_par;
  Tref= Tref_par;
  
  
  /******************************
  ******************************/
  T= u_T;
  y_dRho= dRho;
  
  
  /******************************
  ******************************/
  dT= T - Tref;
  dRho= alphaT*dT;
  
  
  annotation(defaultComponentName = "dRhoBydT",
  Icon(graphics = {Text(origin = {0, -110}, extent = {{-120, 10}, {120, -10}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
  
end dRhoByT_00;
