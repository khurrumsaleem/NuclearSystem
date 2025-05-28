within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model NukeNumDensityRelation_Base
  import unit=Modelica.Units.SI;
  import const= Modelica.Constants;
  
  unit.NeutronNumberDensity denNum "number density of nulei, 1/m3";
  unit.Density denMass "mass density, kg/m3";
  unit.AtomicMassConstant AM "atomic mass, kg/mole";
  
equation
  
  denNum= denMass*const.N_A/AM;
  
end NukeNumDensityRelation_Base;
