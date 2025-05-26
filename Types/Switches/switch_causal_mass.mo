within NuclearSystem.Types.Switches;

type switch_causal_mass= enumeration
(
  den2mass  "den:input -> mass:output",
  mass2den  "mass:input -> den:output"
) 
"Enumeration to define definition of initial balance equations"
 annotation(
  Documentation(info = "<html>

</html>"));
