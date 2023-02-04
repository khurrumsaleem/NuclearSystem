within NuclearSystem.Constants.UnitConversions;

function factor_eV2J
  extends Modelica.Icons.Function;
  //-----
  output Real y;
algorithm
  y:= 1.602176634*10^(-19);
end factor_eV2J;
