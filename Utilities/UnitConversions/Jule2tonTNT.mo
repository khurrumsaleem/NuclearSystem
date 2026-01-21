within NuclearSystem.Utilities.UnitConversions;

block Jule2tonTNT
  /*-----------------------------------
      imports
  -----------------------------------*/
  import units = Modelica.Units.SI;
  import consts = Modelica.Constants;
  import conv = NuclearSystem.Constants.UnitConversions;
  
  
  
  
  /*-----------------------------------
          interfaces
  -----------------------------------*/
  Modelica.Blocks.Interfaces.RealInput u_Jule(unit = "J") annotation(
    Placement(transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y_tonTNT annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  
  //*********************************************
equation
  
  y_tonTNT= u_Jule*conv.factor_J2tonTNT();
  
  
  
  annotation(
    defaultComponentName = "J2tonTNT",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text( extent = {{-93, 42}, {93, -42}}, textString = "J -> tonTNT")}));
end Jule2tonTNT;
