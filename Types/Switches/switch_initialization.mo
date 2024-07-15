within NuclearSystem.Types.Switches;

type switch_initialization= enumeration
(
  Free  "Free -- Initial guess value",
  FixedInitial  "FixedInitial -- Dynamic balance, Initial value fixed"
) "Enumeration to define definition of initial balance equations"
annotation (Documentation(info=
"<html>

</html>"));
