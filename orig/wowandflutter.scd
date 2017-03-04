/*** wowandflutter.scd: simulating wow and flutter ***/
(
SynthDef(\wow, {|freq=440, wow=0, wowsps=1, dur=1|
var freqenv, ampenv, out;
freqenv = EnvGen.kr(Env(freq*[1,1+wow,1,1,1], [wow/2,wow/2,1-wow, 0]/wowsps, \lin, 3, 0));
ampenv = EnvGen.kr(Env([0,1,1,0], [0.05, dur-0.1, 0.05]), doneAction:2);
out = SinOsc.ar(freqenv, mul:ampenv);
Out.ar(0, out);
}).add;
)
(
var freq=800, wowsps=4, dur=2;
var wow = rrand([0, 1.0], [1.0, 10])/100;
Pbind(
\instrument, \wow,
\freq, freq,
\wowsps, wowsps,
\dur, dur,
\wow, Pseq(wow),
).play
)