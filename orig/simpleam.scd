/*** simpleam.scd: simple Amplitude Modulation (AM) ***/
(
{
var mod, car;
mod = SinOsc.ar(200);
car = SinOsc.ar(500, mul:(1+mod)/2);
}.play;
)