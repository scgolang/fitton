/*** fmindex.scd: Frequency Modulation index ***/
(
SynthDef(\fmindex, {|carfreq=500, mcratio=0.4, fmindex=1, dur=1|
var env, mod, car;
env = EnvGen.kr(Env.linen(dur/100, dur*98/100, dur/100), doneAction:2);
mod = SinOsc.ar(carfreq*mcratio, mul:carfreq*mcratio*fmindex);
car = SinOsc.ar(carfreq+mod);
Out.ar(0, car*env);
}).add;
)
(
var index;
index = Pseq([0, 1, 10]);
Pbind(
\instrument, \fmindex,
\fmindex, index,
\dur, 2,
).play
)