within NuclearSystem.Constants.UnitConversions;

function eV2J
  extends Modelica.Icons.Function;
  //-----
  input Real u;
  output Real y;
algorithm
  y:= u*1.602176634*10^(-19);
end eV2J;
