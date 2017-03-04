/*** r2d2.scd: simulating Star Wars R2D2 ***/
(
SynthDef(\sine, {|freq=440, dur=1|
var env = EnvGen.kr(Env.linen(0.01, dur-0.02, 0.01, 0.707), doneAction:2);
Out.ar(0, SinOsc.ar(freq, mul:env))
}).add;
)
(
var freqs, notedur=1/10, songdur=5;
freqs = {exprand(1000, 4000)}!(songdur/notedur);
Pbind(
\instrument, \sine,
\freq, Pseq(freqs),
\dur, notedur,
).play
)