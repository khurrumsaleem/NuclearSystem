within NuclearSystem.Types.Switches;

type switch_initialization= enumeration
(
  DynamicFreeInitial  "DynamicFreeInitial -- Dynamic balance, Initial guess value",
  FixedInitial  "FixedInitial -- Dynamic balance, Initial value fixed",
  FixedDerInitial "FixedDerInitial -- Initial der value fixed"
) "Enumeration to define definition of initial balance equations"
annotation (Documentation(info=
"<html>

</html>"));
