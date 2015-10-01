#adjust friction etc per terrain
var terrain_survol = func (id) {

  var loopid=getprop("/environment/terrain-info/terrain_servol_loopid");
  if (loopid==nil) terrain_survol_loopid=0;
  id==loopid or return;
  settimer (func {terrain_survol(id)}, 0.12734); 
 
  var lat = getprop("/position/latitude-deg");
  var lon = getprop("/position/longitude-deg");
  var info = geodinfo(lat, lon);
      if ( (info != nil) and (info[1] != nil)) {
          if (info[1].solid ==nil) info[1].solid = 1;
          setprop("/environment/terrain-info/terrain",info[1].solid);   # 1 if solid land, 0 if water
          setprop("/fdm/jsbsim/terrain-info/terrain",info[1].solid);   # 1 if solid land, 0 if water
         
           
          if (info[1].load_resistance ==nil) info[1].load_resistance = 1e+30;
          setprop("/environment/terrain-info/terrain-load-resistance",info[1].load_resistance);
         
          if (info[1].friction_factor ==nil) info[1].friction_factor = 1.05;
          setprop("/environment/terrain-info/terrain-friction-factor",info[1].friction_factor);
         
          if (info[1].bumpiness ==nil) info[1].bumpiness = 0;
         
          setprop("/environment/terrain-info/terrain-bumpiness",info[1].bumpiness);
         
          if (info[1].rolling_friction ==nil) info[1].rolling_friction = 0.02;
         
          setprop("/environment/terrain-info/terrain-rolling-friction",info[1].rolling_friction);
         
          if (info[1].names ==nil) info[1].names="";
          setprop("/environment/terrain-info",info[1].names[0]);
                   
      } else {
        setprop("/environment/terrain-info/terrain",1);
        setprop("/environment/terrain-info/terrain-load-resistance",1e+30);
        setprop("/environment/terrain-info/terrain-friction-factor",1.05);
        setprop("/environment/terrain-info/terrain-bumpiness",0);
        setprop("/environment/terrain-info/terrain-rolling-friction",0.02);
      }
     
  friction_loop();   
 
}




var friction_init =func {
  for (var n=0;n<getprop("/fdm/jsbsim/gear/num-units"); n+=1) {
   
    var x = getprop("/fdm/jsbsim/gear/unit["~n~"]/side_friction_coeff");
    if (x==nil) x=0;
    setprop ("/environment/terrain-info/gear/unit["~n~"]/side_friction_coeff_aircraft",x );
   
    var x = getprop("/fdm/jsbsim/gear/unit["~n~"]/static_friction_coeff");
    if (x==nil) x=0;
    setprop ("/environment/terrain-info/gear/unit["~n~"]/static_friction_coeff_aircraft", x );

    var x = getprop("/fdm/jsbsim/gear/unit["~n~"]/dynamic_friction_coeff");
    if (x==nil) x=0;
    setprop ("/environment/terrain-info/gear/unit["~n~"]/dynamic_friction_coeff_aircraft", x );
   
    var x = getprop("/fdm/jsbsim/gear/unit["~n~"]/rolling_friction_coeff");
    if (x==nil) x=0;
    setprop ("/environment/terrain-info/gear/unit["~n~"]/rolling_friction_coeff_aircraft", x );
   
    print ("Aircraft friction parameters initialized");
  }
} 
   
var friction_loop = func {

  for (var n=0;n<getprop("/fdm/jsbsim/gear/num-units"); n+=1) {
    var tff=getprop("/environment/terrain-info/terrain-friction-factor" );
    if (tff==nil) tff=1;
   
    setprop ("/fdm/jsbsim/gear/unit["~n~"]/side_friction_coeff",
     getprop("/environment/terrain-info/gear/unit["~n~"]/side_friction_coeff_aircraft") *
     tff ) ;
   
    var bff= getprop("/environment/terrain-info/gear/unit["~n~"]/static_friction_coeff_aircraft");
    #print (bff==nil, " ", n);
    setprop ("/fdm/jsbsim/gear/unit["~n~"]/static_friction_coeff",
      bff * tff ) ;
   
    setprop ("/fdm/jsbsim/gear/unit["~n~"]/dynamic_friction_coeff",
     getprop("/environment/terrain-info/gear/unit["~n~"]/dynamic_friction_coeff_aircraft") *
     tff);   
     
    setprop ("/fdm/jsbsim/gear/unit["~n~"]/rolling_friction_coeff",
     getprop("/environment/terrain-info/gear/unit["~n~"]/rolling_friction_coeff_aircraft") +
     getprop("/environment/terrain-info/terrain-rolling-friction" ) ) ;
     
  }
 
  #print ("Camel/JSBSim: Friction parameters updated");
} 

friction_init();
var terrain_survol_loopid=getprop("/environment/terrain-info/terrain_servol_loopid");
if (terrain_survol_loopid==nil) terrain_survol_loopid=0;
terrain_survol_loopid+=1;
setprop("/environment/terrain-info/terrain_servol_loopid", terrain_survol_loopid);
terrain_survol(terrain_survol_loopid);  