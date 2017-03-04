/*** comb.scd: comb filtering ***/
(
SynthDef(\comb, {|dur=1, amp=1, delayT=0, decayT=0|
var mod, dry, wet, output;
mod = XLine.ar(100, s.sampleRate/2, dur, doneAction:2);
dry = SinOsc.ar(mod, mul:amp);
wet = CombC.ar(dry, delayT, delayT, decayT);
output = (dry+wet)/2;
Out.ar(0, output);
}).add
)
(
var delay = [0.002, 0.01, 0.05, 0.1, 1];
Pbind(
\instrument, \comb,
\delayT, Pseq(delay),
\dur, 3,
\amp, 0.707,
).play;
)