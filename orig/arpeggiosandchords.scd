/*** arpeggiosandchords.scd: arpeggios and chords ***/
(
SynthDef(\sine, {|freq=440, amp=0.707, dur=1|
var env, envgen;
env = Env([0, 1, 1, 0]*amp, [0.01, dur-0.02, 0.01]);
envgen = EnvGen.ar(env, doneAction:2);
Out.ar(0, SinOsc.ar(freq, mul:envgen))
}).add;
)
(
var key=60, score;
j = [0,4,7,12];
k = [0,3,7,12];
score = j++j++(k-3)++(k-3)++(j-7)++(j-7)++[j-5]++[j-5];
score = (key+score).midicps;
Routine({
score.do{|i|
if (i.size>0,
{i.size.do{|y| Synth(\sine, [\freq, i[y], \amp, 0.707/i.size, \dur, 0.5])}; 1.wait},
{Synth(\sine, [\freq, i, \dur, 0.25]); 0.25.wait});
}}).play;
)