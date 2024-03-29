togglereverser = func {
	r1 = "/fdm/jsbsim/propulsion/engine";
	r2 = "/fdm/jsbsim/propulsion/engine[1]";
	r3 = "/fdm/jsbsim/propulsion/engine[2]";
	r4 = "/fdm/jsbsim/propulsion/engine[3]";

	r5 = "/controls/engines/engine"; 
	r6 = "/controls/engines/engine[1]"; 
	r7 = "/controls/engines/engine[2]"; 
	r8 = "/controls/engines/engine[3]"; 

	r9 = "/sim/input/selected";

	rv1 = "/engines/engine/reverser-pos-norm"; 
	rv2 = "/engines/engine[1]/reverser-pos-norm"; 
	rv3 = "/engines/engine[2]/reverser-pos-norm"; 
	rv4 = "/engines/engine[3]/reverser-pos-norm"; 

	val = getprop(rv1);
	if (
		(val == 0 or val == nil) and (getprop("/controls/engines/engine[0]/throttle") == 0) and 
		(getprop("/controls/engines/engine[1]/throttle") == 0) and 
		(getprop("/controls/engines/engine[2]/throttle") == 0) and 
		(getprop("/controls/engines/engine[3]/throttle") == 0)
	) {
		interpolate(rv1, 1.0, 1.4); 
		interpolate(rv2, 1.0, 1.4);  
		interpolate(rv3, 1.0, 1.4); 
		interpolate(rv4, 1.0, 1.4);

		setprop(r1,"reverser-angle-rad","180");
		setprop(r2,"reverser-angle-rad","180");
		setprop(r3,"reverser-angle-rad","180");
		setprop(r4,"reverser-angle-rad","180");

		setprop(r5,"reverser", "true");
		setprop(r6,"reverser", "true");
		setprop(r7,"reverser", "true");
		setprop(r8,"reverser", "true");

		setprop(r9,"engine", "true");
		setprop(r9,"engine[1]", "true");
		setprop(r9,"engine[2]", "true");
		setprop(r9,"engine[3]", "true");
	} else {
		if (
			(val == 1.0) and (getprop("/controls/engines/engine[0]/throttle") == 0) and 
			(getprop("/controls/engines/engine[1]/throttle") == 0) and 
			(getprop("/controls/engines/engine[2]/throttle") == 0) and 
			(getprop("/controls/engines/engine[3]/throttle") == 0)
		) {
			interpolate(rv1, 0.0, 1.4);
			interpolate(rv2, 0.0, 1.4);   
			interpolate(rv3, 0.0, 1.4);
			interpolate(rv4, 0.0, 1.4);

			setprop(r1,"reverser-angle-rad",0);
			setprop(r2,"reverser-angle-rad",0);
			setprop(r3,"reverser-angle-rad",0);
			setprop(r4,"reverser-angle-rad",0);

			setprop(r5,"reverser",0);
			setprop(r6,"reverser",0);
			setprop(r7,"reverser",0);
			setprop(r8,"reverser",0);

			setprop(r9,"engine", "true");
			setprop(r9,"engine[1]", "true");
			setprop(r9,"engine[2]", "true");
			setprop(r9,"engine[3]", "true");
		}
	}
}
