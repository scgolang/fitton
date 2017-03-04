/* first.scd: your first SuperCollider programme plays a sine wave */
(
{
var sinewave;
sinewave = SinOsc.ar(freq:440, phase:0, mul:1, add:0);
}.play;
)