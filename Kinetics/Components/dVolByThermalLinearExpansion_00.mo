within NuclearSystem.Kinetics.Components;

block dVolByThermalLinearExpansion_00

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
  parameter units.Volume VolRef_par=1.0;
  parameter units.LinearExpansionCoefficient alphaL_par=10.94e-6;
  
  
  
  
  /*-----------------------------------
      variables
  -----------------------------------*/
  units.Volume VolRef(start=VolRef_par);
  units.Temperature Tref(start=Tref_par);
  units.LinearExpansionCoefficient alphaL(start=alphaL_par);
  units.Volume dVol(start=0);
  Real dVolqVolRef(start=0);
  units.Temperature T(start=Tref_par);
  units.Temperature dT(start=0);
  units.Volume Vol(start=VolRef_par);
  
  
  
  /*-----------------------------------
          interfaces
      -----------------------------------*/
  Modelica.Blocks.Interfaces.RealOutput y_Vol(unit = "m3") annotation(
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
  Tref=Tref_par;
  alphaL=alphaL_par;
  VolRef= VolRef_par;
  
  
  /******************************
  ******************************/
  T= u_T;
  y_Vol= Vol;
  
  
  /******************************
  ******************************/
  dT= T - Tref;
  dVolqVolRef= 3*alphaL*dT;
  dVol= dVolqVolRef*VolRef;
  Vol=VolRef + dVol;
  
  

  
  
  annotation(defaultComponentName = "dVolByT",
  Icon(graphics = {Text(origin = {0, -110}, extent = {{-120, 10}, {120, -10}}, textString = "%name"), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
  
end dVolByThermalLinearExpansion_00;
