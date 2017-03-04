/*** simplefm.scd: simple Frequency Modulation (FM) ***/
(
{
var mod, car;
mod = SinOsc.ar(200, mul:200);
car = SinOsc.ar(500+mod);
}.play;
)