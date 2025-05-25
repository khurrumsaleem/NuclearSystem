within NuclearSystem.Types.Switches;

type switch_causal_alpha= enumeration
(
  alpha2VCore  "alpha:input -> VCore output",
  VCore2alpha  "VCore output -> alpha:input"
) 
"Enumeration to define definition of initial balance equations"
 annotation(
  Documentation(info = "<html>

</html>"));
