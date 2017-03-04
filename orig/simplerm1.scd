/*** simplerm1.scd: simple Ring Modulation (RM) method 1: multiplication of two signals ***/
(
{
var mod, car, output;
mod = SinOsc.ar(200);
car = SinOsc.ar(500);
output = car*mod;
}.play;
)