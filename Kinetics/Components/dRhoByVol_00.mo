within NuclearSystem.Kinetics.Components;

block dRhoByVol_00

  /*-----------------------------------
      imports
  -----------------------------------*/
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  import conv = NuclearSystem.Constants.UnitConversions;
  
  
  
  /*-----------------------------------
      parameters
  -----------------------------------*/
  parameter units.Volume VolRef_par=1.0;
  parameter units.LinearExpansionCoefficient alphaVol_par=-5e-1;
  
  
  
  
  /*-----------------------------------
      variables
  -----------------------------------*/
  units.Volume VolRef(start=VolRef_par);
  units.LinearExpansionCoefficient alphaVol(start=alphaVol_par);
  units.Volume dVol(start=0);
  Real dVolqVolRef(start=0);
  units.Volume Vol(start=1);
  Real dRho(start=0);
  
  
  
  /*-----------------------------------
          interfaces
      -----------------------------------*/
  Modelica.Blocks.Interfaces.RealOutput y_dRho(unit = "m3") annotation(
    Placement(transformation(origin = {110, -1}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_Vol(unit="K") annotation(
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
  alphaVol=alphaVol_par;
  VolRef= VolRef_par;
  
  
  /******************************
  ******************************/
  Vol= u_Vol;
  y_dRho= dRho;
  
  
  /******************************
  ******************************/
  dVol= Vol - VolRef;
  dVolqVolRef= dVol/VolRef;
  dRho= alphaVol*dVolqVolRef;
  
  
  annotation(defaultComponentName = "dRhoBydVol",
  Icon(graphics = {Text(origin = {0, -110}, extent = {{-120, 10}, {120, -10}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
  
end dRhoByVol_00;
