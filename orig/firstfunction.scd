/*** firstfunction.scd: your first example of playing a function ***/
(
var sinewave;
sinewave = {SinOsc.ar(freq:440, phase:0, mul:1, add:0)};
sinewave.play;
)