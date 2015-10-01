# =====
# Doors
# =====

Doors = {};

Doors.new = func {
   obj = { parents : [Doors],
           cargorampfront : aircraft.door.new("instrumentation/doors/cargorampfront",  8.0, 0),
		   rampfrontkneeled : aircraft.door.new("instrumentation/doors/rampfrontkneeled",  8.0, 0),
           cargodoorfront : aircraft.door.new("instrumentation/doors/cargodoorfront", 8.0, 0),
		   cargoramprear : aircraft.door.new("instrumentation/doors/cargoramprear",  8.0, 0),
		   ramprearkneeled : aircraft.door.new("instrumentation/doors/ramprearkneeled",  8.0, 0),
           cargodoorrear : aircraft.door.new("instrumentation/doors/cargodoorrear", 8.0, 0),
		   crewdoor : aircraft.door.new("instrumentation/doors/crewdoor", 8.0, 0),
         };
   return obj;
};

Doors.cargorampfrontexport = func {
   me.cargorampfront.toggle();
}

Doors.rampfrontkneeledexport = func {
   me.rampfrontkneeled.toggle();
}

Doors.cargodoorfrontexport = func {
   me.cargodoorfront.toggle();
}
Doors.cargoramprearexport = func {
   me.cargoramprear.toggle();
}

Doors.ramprearkneeledexport = func {
   me.ramprearkneeled.toggle();
}

Doors.cargodoorrearexport = func {
   me.cargodoorrear.toggle();
}

Doors.crewdoorexport = func {
   me.crewdoor.toggle();
}

# ==============
# Initialization
# ==============

# objects must be here, otherwise local to init()
doorsystem = Doors.new();


## Interpolate Animation According to Aircraft Position (Kneeled or Not Kneeled) ##

#fntrampinterpolate = func(v) {
#    if (v = 1) {
#        if(!getprop("sim/model/kneelac"))interpolate("instrumentation/doors/cargorampfront", 1, 15);
#    }
#	elsif (v = 0) {
#      interpolate("instrumentation/doors/cargorampfront", 1, 25);
#    }
#}

#bckrampinterpolate = func(u) {
#    if (u = 1) {
#        if(!getprop("sim/model/kneelac"))interpolate("instrumentation/doors/cargoramprear", 1, 15);
#    }
#	elsif (u = 0) {
#      interpolate("instrumentation/doors/cargoramprear", 1, 25);
#    }
#}











