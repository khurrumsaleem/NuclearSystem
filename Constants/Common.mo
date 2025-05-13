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

annotation(
    defaultComponentName = "NukeSys_Common",
    Diagram(graphics),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -6}, extent = {{-100, 24}, {100, -24}}, textString = "NuclearSystem
Common Constants"), Text(origin = {0, -111}, extent = {{-120, 9}, {120, -9}}, textString = "%name")}));
end Common;
