within NuclearSystem.Constants.UnitConversions;

function factor_J2tonTNT
  extends Modelica.Icons.Function;
  //-----
  output Real y;
algorithm
  y:= 1/(4.184*10^9);
end factor_J2tonTNT;
