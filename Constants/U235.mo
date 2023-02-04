within NuclearSystem.Constants;

model U235
  import units= Modelica.Units.SI;
  constant Real nNeu=143 "number of neutron";
  //https://en.wikipedia.org/wiki/Uranium-235
  constant Real Natm=9.48*10^(20)*10^(6) "atomic number density [atoms/m3]";
  //https://www.nuclear-power.com/nuclear-power/reactor-physics/nuclear-engineering-fundamentals/neutron-nuclear-reactions/atomic-number-density/
  
equation
  
end U235;
