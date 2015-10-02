# =====
# Kneel
# =====

Kneel = {};

Kneel.new = func {
	obj = { parents : [Kneel], kneelac : aircraft.door.new("sim/model/kneelac", 10.0), };
	return obj;
};

Kneel.kneelacexport = func {
	me.kneelac.toggle();
}


# ==============
# Initialization
# ==============

# objects must be here, otherwise local to init()
kneelsystem = Kneel.new();
