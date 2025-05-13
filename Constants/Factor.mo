within NuclearSystem.Constants;

model Factor
  import units= Modelica.Units.SI;
  
  constant Real mole2num= 6.02214076*10^23 "";
    //source:
equation

annotation(
    defaultComponentName = "NukeSys_Factors",
    Diagram,
  Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -2}, extent = {{-100, 26}, {100, -26}}, textString = "NuclearSystem
Factors"), Text(origin = {0, -112}, extent = {{-120, 8}, {120, -8}}, textString = "%name")}));
end Factor;
