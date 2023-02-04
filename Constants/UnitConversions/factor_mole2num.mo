within NuclearSystem.Constants.UnitConversions;

function factor_mole2num
  extends Modelica.Icons.Function;
  //-----
  output Real y;
algorithm
  y:= 6.02214076*10^23;
end factor_mole2num;
