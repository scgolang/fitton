/*** amsynth.scd: an Amplitude Modulation synthesiser with bells and whistles ***/
(
SynthDef (\ami, {|carFreq=500, index=1, ratio=1, dur=1, amp=1|
var mi, unmod, mod, car, env, output;
mi = Line.ar(0, index, dur);
unmod = SinOsc.ar(carFreq, mul:1-mi);
mod = SinOsc.ar(carFreq*ratio, 3pi/2, mi/2, mi/2);
car = SinOsc.ar(carFreq, mul:mod);
env = EnvGen.kr(Env.linen(dur*0.05, dur*0.9, dur*0.05, amp, \sine), doneAction:2);
output = (car+unmod)*env;
OffsetOut.ar(0, output);
}).add;
)
(
SynthDef (\rmi, {|carFreq=500, index=1, ratio=1, dur=1, amp=1|
var mi, unmod, mod, car, env, output;
mi = Line.ar(0, index, dur);
unmod = SinOsc.ar(carFreq, mul:1-mi);
mod = SinOsc.ar(carFreq*ratio, mul:mi);
car = SinOsc.ar(carFreq, mul:mod);
env = EnvGen.kr(Env.linen(dur*0.05, dur*0.9, dur*0.05, amp, \sine), doneAction:2);
output = (car+unmod)*env;
OffsetOut.ar(0, output);
}).add;
)
(
var patt1, patt2;
patt1 = Pbind(
\instrument, \ami,
\carFreq, Pseq([[77, 81, 84].midicps]),
\index, 1,
\ratio, 0.4,
\strum, 0.1,
\dur, Pseq([4, 3.9, 3.8]),
\amp, 1/3
);
patt2 = Pbind(
\instrument, \rmi,
\carFreq, Pseq([[72, 76, 79]].midicps),
\index, 1,
\ratio, 0.4,
\dur, 4,
\amp, 1/3
);
(patt1++patt2).play
)