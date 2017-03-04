/*** ampfx.scd: using envelopes as sound effects ***/
({
var dur=1, env16seg, trig, envgen, output;
env16seg = Env([0.01, 1, 0.01, 7/8, 0.01, 6/8, 0.01, 5/8, 0.01, 4/8, 0.01, 3/8, 0.01, 2/8, 0.01, 1/8, 0.01]*0.707, dur/16!16, \exp);
trig = SinOsc.ar(1/dur, mul:1/2);
envgen = EnvGen.ar(env16seg, trig);
output = SinOsc.ar(mul:envgen);
}.play;
)
(
SynthDef(\sinenv, {
|freq=440, amp=1, dur=1|
var env, trig, envgen, output;
env = Env([0, 0.707, 0.65, 0.4, 0]*amp, [1/64, 3/32, 14/16, 1/64]*dur, -4);
trig = SinOsc.ar(1/dur, mul:1/2);
envgen = EnvGen.ar(env, trig);
Out.ar(0, SinOsc.ar(freq, mul:envgen))
}).add;
)
(
a = Synth(\sinenv, [\amp, 1/3]);
b = Synth(\sinenv, [\freq, 550, \amp, 1/3, \dur, 2]);
c = Synth(\sinenv, [\freq, 660, \amp, 1/3, \dur, 3]);
)
a.free; b.free; c.free;