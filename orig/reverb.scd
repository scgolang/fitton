/*** reverb.scd: reverb using a delay line and feedback ***/
(
SynthDef(\reverb,{|freq=440, amp=0.1, dur=10|
var env, in, output=0, maxdelay=1, delay;
env = EnvGen.ar(Env([0,amp,0], [1/2,1/2]));
in = SinOsc.ar(freq, mul:env);
delay = [0, 1/7, 1/5, 1/2];
delay.size.do{|i| output=output+CombC.ar(in, maxdelay, delay[i], dur)};
DetectSilence.ar(output, -60.dbamp, doneAction:2);
Out.ar(0, output);
}).add;
)
(
var gbsus, dur;
gbsus = [66, 73, 78, 82, 83, 88].midicps;
dur = (10, 9.9..9.5);
Routine{
dur.size.do{|i|
Synth(\reverb, [\freq, gbsus[i], \dur, dur[i]]); 0.1.wait;
};
}.play;
)