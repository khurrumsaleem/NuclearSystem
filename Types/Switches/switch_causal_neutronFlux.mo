within NuclearSystem.Types.Switches;

type switch_causal_neutronFlux= enumeration(
  
  PHI2den "PHI (neutron flux):input -> neutron density:output", 
  den2PHI "neutron density:input -> PHI (neutron flux):output"
  
) "Enumeration to define definition of initial balance equations" annotation(
  Documentation(info = "<html>

</html>"));
