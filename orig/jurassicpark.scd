/*** jurassicpark.scd: Jurassic Park sound effects ***/
(
SynthDef(\pulsetrain, {|dur=2, fundstart=16, fundend=16, harmnum=50|
var amp, gliss, input, output;
amp = EnvGen.ar(Env([0.001, 0.707, 0.25, 0.001], [0.2, 0.5, 0.3]*dur, \exp), doneAction:2);
gliss = EnvGen.ar(Env([fundstart, fundstart, fundend, fundend], [0.2, 0.6, 0.2]*dur, \exp));
input = Blip.ar(gliss, harmnum, amp);
output = LPF.ar(input, 1500);
Out.ar(0, input);
}).add
)
(
var fundstart, fundend, harmnum;
fundstart = [16.0, 8.5, 53.0];
fundend = [14.5, 9.0, 49.0];
harmnum = [50, 10, 40];
Pbind(
\instrument, \pulsetrain,
\dur, Pseq([5], inf),
\fundstart, Pseq(fundstart),
\fundend, Pseq(fundend),
\harmnum, Pseq(harmnum),
).play
)