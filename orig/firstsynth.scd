/*** firstsynth.scd: your first example of playing a synth ***/
(
SynthDef(\sinewave, {
|freq=440, phase=0, amp=1, add=0|
var sinewave;
sinewave = SinOsc.ar(freq, phase, amp, add);
Out.ar(0, sinewave);
}).add;
)
y = Synth(\sinewave);
y.set(\freq, 550);