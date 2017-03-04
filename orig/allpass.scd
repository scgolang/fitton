/*** allpass.scd: phasing using allpass filtering ***/
(
{
var dry, mod, wet, output;
dry = SinOsc.ar(mul:1/2);
mod = XLine.ar(1, 22050, 3, doneAction:2);
wet = BAllPass.ar(dry, mod);
output = wet-dry;
}.play
)