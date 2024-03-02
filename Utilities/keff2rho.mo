within NuclearSystem.Utilities;

block keff2rho
  Modelica.Blocks.Interfaces.RealInput u_keff annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_rho annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));

//*********************************************
equation
  
  y_rho= (u_keff-1)/u_keff;
  
annotation(
    defaultComponentName = "keff2rho",
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -113}, extent = {{-100, 9}, {100, -9}}, textString = "%name")}));

end keff2rho;
