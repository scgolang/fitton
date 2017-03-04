/*** pluck.scd: physical modelling with Pluck ***/
(
SynthDef(\pluck,{|note=60, dur=1|
var env, input, trigger, delayT, decayT=2, output;
env = EnvGen.kr(Env.perc(releaseTime: dur-0.01+decayT), doneAction:2);
input = WhiteNoise.ar(0.2)*env;
trigger = Impulse.ar(dur);
delayT = 1/(note.midicps);
output = Pluck.ar(input, trigger, delayT, delayT, decayT, 0.1);
Out.ar(0, output)
}).add
)
(
Pbind(
\instrument, \pluck,
\note, Pwhite(36, 84, 16),
\dur, 1/4,
).play
)