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
  parameter units.Temperature T0_par=1873.15;
  parameter units.LinearExpansionCoefficient alphaL_par=10.94e-6;
  parameter units.Volume Vol0_par=1.0;
  
  
  
  /*-----------------------------------
      variables
  -----------------------------------*/
  units.Volume Vol0;
  units.Temperature T0;
  units.LinearExpansionCoefficient alphaL;
  units.Volume dVol;
  Real dVolqVol0;
  units.Temperature dT;
  units.Volume Vol;
  
  
  /*-----------------------------------
      interfaces
  -----------------------------------*/
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_Vol(unit="m3") annotation(
    Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  //*********************************************

initial equation
  /******************************
  ******************************/
  T0=T0_par;
  alphaL=alphaL_par;
  Vol0= Vol0_par;
  y_Vol= Vol0_par;

equation
  /******************************
  ******************************/
  T0=T0_par;
  alphaL=alphaL_par;
  Vol0= Vol0_par;
  
  
  /******************************
  ******************************/
  heatPort.Q_flow=0;
  y_Vol= Vol;
  
  
  /******************************
  ******************************/
  dT=heatPort.T - T0;
  dVolqVol0= 3*alphaL*dT;
  dVol= dVolqVol0*Vol0;
  Vol=Vol0+dVol;
  
end dVolByThermalLinearExpansion;
