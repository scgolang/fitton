/*** echo.scd: using a delay line to create an echo ***/
b = Buffer.alloc(s, s.sampleRate);
(
SynthDef(\echo, {|buffer=0, delayT=0.02|
var env, in, ptr, tap, output;
env = EnvGen.ar(Env([0,1/2,0,0], [1/40,1/40,38/40]), doneAction:2);
in = SinOsc.ar(mul:env);
ptr = DelTapWr.ar(buffer, in);
tap = DelTapRd.ar(buffer, ptr, delayT);
output = Mix.ar([in, tap]);
Out.ar(0, output)
}).add
)
(
var delay = [0.1, 0.05, 0.01];
Pbind(
\instrument, \echo,
\buffer, b,
\delayT, Pseq(delay),
).play
)
b.free