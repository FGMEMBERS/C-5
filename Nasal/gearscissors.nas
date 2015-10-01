import("math");
var acos = func(x) { math.atan2(math.sqrt(math.abs(1-x*x)), x) }
var R2D = 180.0 / math.pi;

var scissor_dist = 0.51;
var scissor = 0.255;
var oleo = 0.51;

var theta0 = acos(scissor_dist/2/scissor) * R2D;
print( "<?xml version = '1.0' encoding = 'UTF-8' ?>\n" );
print( "<PropertyList>\n" );

for( var i = 0; i < 1.05; i += 0.05 ) {
  print( "<entry>\n" );
  var l = (1.0-i) * oleo/2;
  l += (scissor_dist-oleo)/2;
  print( "<ind>" ~ sprintf("%4.3f", i ) ~ "</ind>\n" );
  print( "<dep>" ~ sprintf("%4.3f", acos( l / scissor ) * R2D - theta0 ) ~ "</dep>\n" );
  print( "</entry>\n" );
}
print( "</PropertyList>\n" );