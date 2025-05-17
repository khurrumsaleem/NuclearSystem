within NuclearSystem.Interface;

connector SinglePortReal = Real
    annotation(
    defaultComponentName = "port_Real",
    Icon(graphics = {Rectangle(fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-80, 80}, {80, -80}})}, coordinateSystem(extent = {{-80, -80}, {80, 80}})));
