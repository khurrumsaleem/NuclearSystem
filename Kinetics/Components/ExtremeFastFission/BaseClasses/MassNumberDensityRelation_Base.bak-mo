within NuclearSystem.Kinetics.Components.ExtremeFastFission.BaseClasses;

model MassNumberDensityRelation_Base
  import units=Modelica.Units.SI;
  import const= Modelica.Constants;
  
  units.NeutronNumberDensity denNum "number density of nulei, 1/m3";
  units.Density denMass "mass density, kg/m3";
  units.AtomicMassConstant AM "atomic mass, kg/mole";
  
  units.Mass mass;
  Real num;
  units.Volume Vol;
  
equation
  
  denNum= denMass*const.N_A/AM;
  num= denNum*Vol;
  mass= denMass*Vol;
  
end MassNumberDensityRelation_Base;
