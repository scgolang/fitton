/*** amindex.scd: Amplitude Modulation index ***/
(
SynthDef (\ami, {|modFreq=200, carFreq=500, index=1, dur=1, amp=1|
var mi, unmod, mod, car, env;
mi = Line.ar(0, index, dur);
unmod = SinOsc.ar(carFreq, mul:1-mi);
mod = SinOsc.ar(modFreq, 3pi/2, mi/2, mi/2);
car = SinOsc.ar(carFreq, mul:mod);
env = EnvGen.kr(Env.linen(dur*0.05, dur*0.9, dur*0.05, amp, \sine), doneAction:2);
OffsetOut.ar(0, (car+unmod)*env);
}).add;
)
(
SynthDef (\rmi, {|modFreq=200, carFreq=500, index=1, dur=1, amp=1|
var mi, unmod, mod, car, env;
mi = Line.ar(0, index, dur);
unmod = SinOsc.ar(carFreq, mul:1-mi);
mod = SinOsc.ar(modFreq, mul:mi);
car = SinOsc.ar(carFreq, mul:mod);
env = EnvGen.kr(Env.linen(dur*0.05, dur*0.9, dur*0.05, amp, \sine), doneAction:2);
OffsetOut.ar(0, (car+unmod)*env);
}).add;
)
Synth(\ami, [\dur, 4]);
Synth(\rmi, [\dur, 4]);