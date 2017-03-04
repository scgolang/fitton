/*** fmratio.scd: FM using a carrier-to-modulator c:m ratio ***/
(
SynthDef(\fmratio, {|modFreq=440, cmratio=1, index=1, dur=1|
var env, mod, car;
env = EnvGen.kr(Env.linen(dur/10, 0, dur*9/10), doneAction:2);
mod = SinOsc.ar(modFreq, mul:modFreq*index);
car = SinOsc.ar((modFreq*cmratio)+mod);
Out.ar(0, car*env);
}).add;
)
(
var cmratios;
cmratios = Pseq([1, 2.25, 3.60, 4.91]);
Pbind(
\instrument, \fmratio,
\cmratio, cmratios,
\index, 5,
\dur, 2,
).play
)