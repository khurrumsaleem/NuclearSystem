within NuclearSystem.Kinetics.Components;

model CritCndi_Bare_ExtrFastFission_00 "Criticality Condition, bare core, extreme fast fissoin"
  import units=Modelica.Units.SI;
  
  /******************************
  parameter
  ******************************/
  parameter units.Area sigmaF_par = 1.199*10^(-28) "";
  parameter units.Area sigmaEl_par = 3.650*10^(-28) "";
  
  /******************************
  variable
  ******************************/
  units.Area sigmaT "transport cross-section";
  
  /******************************
  Internal objects
  ******************************/
  Modelica.Blocks.Interfaces.RealInput u_Rc annotation(
    Placement(transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_dcore annotation(
    Placement(transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput u_n "nuclear number density, [num/m3]" annotation(
    Placement(transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}})));
  //**************************************************
  Modelica.Blocks.Interfaces.RealOutput y_lambdaCoreTrans annotation(
    Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}})));
equation
  
  sigmaT= sigmaF_par + sigmaEl_par;
  y_lambdaCoreTrans= 1/(sigmaT*u_n);
  (u_Rc/y_dcore)*1.0/tan(u_Rc/y_dcore) + (3*y_dcore/(2.0*y_lambdaCoreTrans))*(u_Rc/y_dcore) - 1 = 0;

annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -112}, extent = {{-120, 8}, {120, -8}}, textString = "%name"), Text(origin = {0, -1}, extent = {{-100, 39}, {100, -39}}, textString = "Criticality
Condition")}));
end CritCndi_Bare_ExtrFastFission_00;
