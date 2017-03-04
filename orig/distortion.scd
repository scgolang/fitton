/*** distortion.scd: distortion using waveshaping ***/
b = Buffer.alloc(s, 1024, 1);
b.cheby([1, 1/2, 1, 1/8]);
(
SynthDef(\distortion, {|buffer=0, freq=440, amp=0.707, dur=1|
var input, index, bufout, output, env;
input = SinOsc.ar(freq);
index = LinLin.ar(input, -1.0, 1.0, 0, BufFrames.ir(buffer));
bufout = BufRd.ar(1, buffer, index, 0, 4);
output = LeakDC.ar(bufout);
env = EnvGen.ar(Env.perc(0.01, dur-0.01, amp), doneAction:2);
OffsetOut.ar(0, (output*env)!2);
}).add;
)
(
var notes;
c=[64,67,64,57];
d=[62,66,62,57];
e=[61,64,61,57];
f=[60,62,60,57];
g=[57,64];
x=(c++d++e++f);
notes = ((x!3).flatten++[g]).midicps;
Pbind(
\instrument, \distortion,
\buffer, b,
\freq, Pseq(notes),
\dur, Pseq((1/12)!48++4),
\amp, Pseq((0.707)!48++(1/2)),
).play
)
{LeakDC.ar(Shaper.ar(b.bufnum, SinOsc.ar(MouseX.kr(110, 440, \exponential), 0, 0.707)))}.play;