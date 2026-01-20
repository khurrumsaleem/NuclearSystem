within NuclearSystem.Kinetics.Components;

model dVolByThermalLinearExpansion

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
  
  //parameter units.Temperature T0_par=1873.15;
  //parameter units.Volume Vol0_par=1.0;
  
  
  
  /*-----------------------------------
      variables
  -----------------------------------*/
  units.Volume VolRef;
  units.Temperature Tref;
  units.LinearExpansionCoefficient alphaL;
  units.Volume dVol;
  Real dVolqVolRef;
  units.Temperature T;
  units.Temperature dT;
  units.Volume Vol;
  //units.Volume Vol0;
  //units.Temperature T0;
  
  
  
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
  
end dVolByThermalLinearExpansion;
