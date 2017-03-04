/*** simplerm2.scd: simple Ring Modulation (RM) method 2: modulation of carrier amplitude by a modulator ***/
(
{
var mod, car;
mod = SinOsc.ar(200);
car = SinOsc.ar(500, mul:mod);
}.play;
)