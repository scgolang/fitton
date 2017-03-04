/*** polarrmandam.scd: RM using a bipolar modulator and AM using a unipolar modulator ***/
(
SynthDef (\am, {|modFreq=200, carFreq=500, dur=1|
var mod, car, env;
mod = SinOsc.ar(modFreq, 3pi/2, 1/2, 1/2);
car = SinOsc.ar(carFreq, mul:mod);
env = EnvGen.kr(Env.linen(dur*0.05, dur*0.9, dur*0.05), doneAction:2);
Out.ar(0, car*env);
}).add;
)
(
SynthDef (\rm, {|modFreq=200, carFreq=500, dur=1|
var mod, car, env;
mod = SinOsc.ar(modFreq);
car = SinOsc.ar(carFreq);
env = EnvGen.kr(Env.linen(dur*0.05, dur*0.9, dur*0.05), doneAction:2);
Out.ar(0, car*mod*env);
}).add;
)
(
var freqs, patt1, patt2, patt3, patt4;
freqs = [81, 72, 79, 76].midicps;
patt1 = Pbind(\instrument, \rm, \modFreq, 93, \carFreq, Pser(freqs, 1), \dur, 2);
patt2 = Pbind(\instrument, \am, \modFreq, 93, \carFreq, Pser(freqs, 1), \dur, 2);
patt3 = Pbind(\instrument, \rm, \modFreq, 93, \carFreq, Pseq(freqs, 4), \dur, 1/8);
patt4 = Pbind(\instrument, \am, \modFreq, 93, \carFreq, Pseq(freqs, 4), \dur, 1/8);
(patt1++patt2++patt3++patt4).play
)