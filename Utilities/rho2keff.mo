within NuclearSystem.Utilities;

block rho2keff
  extends NuclearSystem.Icons.BlankWhite_200x200;
  
  Modelica.Blocks.Interfaces.RealInput u_rho annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-110, -2}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_keff annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));

//*********************************************
equation
  
  u_rho= (y_keff-1)/y_keff;
  
annotation(
    defaultComponentName = "rho2keff",
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -113}, extent = {{-100, 9}, {100, -9}}, textString = "%name")}));
end rho2keff;
