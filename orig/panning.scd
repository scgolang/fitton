/*** panning.scd: stereo panning methods ***/
(
p = {|freqL=440, freqR=440, amp=1, dur=1|
var pan, ampL, ampR, env, output;
pan = SinOsc.ar(1/dur, 3pi/2);
pan = (pan+1)/2;
ampL = sqrt(1-pan); ampR = sqrt(pan);
env = EnvGen.ar(Env([0, 1, 1, 0], [0.01, dur-0.02, 0.01], \wel), doneAction:2);
output = SinOsc.ar([freqL, freqR], mul:[ampL, ampR])*env;
}
)
({LinPan2.ar(SinOsc.ar, SinOsc.ar(1/4, 3pi/2))}).play
p.play(args: [\freqR, 550, \dur, 4])
{Balance2.ar(SinOsc.ar, SinOsc.ar(550), SinOsc.ar(1/4, 3pi/2))}.play