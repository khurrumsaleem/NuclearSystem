within NuclearSystem.Constants;

model Common
  import units= Modelica.Units.SI;
  
  constant units.Mass mNeu=1.674927471*10^(-27) "mass, neutron";
    //https://en.wikipedia.org/wiki/Neutron
  constant units.Velocity vNeuFree_Fission_1MeV=1.4*10^7 "avg v of free neutron, emitted by fission";
    //https://nuclearweaponarchive.org/Nwfaq/Nfaq4-1.html
  constant units.Velocity vNeuFree_Fission_2MeV=1.8*10^7 "avg v of free neutron, emitted by fission";
    //https://nuclearweaponarchive.org/Nwfaq/Nfaq4-1.html
  
equation

end Common;
