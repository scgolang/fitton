/*** darthvader.scd: simulating Darth Vader formants ***/
(
SynthDef(\formant, {|centre=440, bwidth=1, amp=1, dur=1|
var env, input, rq, output;
env = EnvGen.ar(Env([0.01, 1, 0.7, 0.01]*amp, [0.2, dur-0.5, 0.3], \exp), doneAction:2);
input = WhiteNoise.ar*env;
rq = bwidth/centre;
output = Resonz.ar(input, centre, rq);
Out.ar(0, output);
}).add
)
(
a = [600,60,0,1040,70, -7,2250,110, -9,2450,120, -9,2750,130,-20];
e = [400,40,0,1620,80,-12,2400,100, -9,2800,120,-12,3100,120,-18];
i = [250,60,0,1750,90,-30,2600,100,-16,3050,120,-22,3340,120,-28];
o = [400,40,0, 750,80,-11,2400,100,-21,2600,120,-20,2900,120,-40];
u = [350,40,0, 600,80,-20,2400,100,-32,2675,120,-28,2950,120,-36];
Routine{
[a,e,i,o,u].do{|m|
5.do{|n|
Synth(\formant, [\centre, m[n*3], \bwidth, m[n*3+1], \amp, m[(n*3+2)].dbamp]);
};
1.wait;
};
}.play;
)