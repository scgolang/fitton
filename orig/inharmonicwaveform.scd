/*** inharmonicwaveform.scd: inharmonic waveform ***/
(
SynthDef(\inharmony, {
|freq=440, amp=1, dur=1|
var env, wave;
env = EnvGen.ar(Env.triangle(dur), doneAction:2);
wave = Klang.ar(`[[1, 2.7, 5.4, 8.1], amp/4!4], freq);
Out.ar(0, wave*env);
}).add;
)
(
Pbind(
\instrument, \inharmony,
\note, Pseq([0, 12, 14, -11, -12]),
\dur, Pseq(9!5),
\amp, 0.707,
\delta, 3
).play;
)