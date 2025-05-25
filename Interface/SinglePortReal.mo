within NuclearSystem.Interface;

connector SinglePortReal = Real
    annotation(
    defaultComponentName = "port_Real",
    Icon(graphics = {Rectangle(fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-80, 80}, {80, -80}})}, coordinateSystem(extent = {{-80, -80}, {80, 80}})),
    Diagram(graphics = {Text(origin = {-10, -115}, extent = {{-130, 11}, {130, -11}}, textString = "%name"), Rectangle(fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, lineThickness = 5, extent = {{-100, 100}, {100, -100}})}));
