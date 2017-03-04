/*** ringmod.scd: a Ring Modulator ***/
(
SynthDef(\ringMod, {|carNote=0, modNote=0, dur=1|
var mod, car, env;
mod = SinOsc.ar((modNote+60).midicps);
car = SinOsc.ar((carNote+60).midicps, mul:mod);
env = EnvGen.kr(Env.triangle(dur:dur), doneAction:2);
Out.ar(0, car*env);
}).add;
)
(
var cars, mod;
cars = Pseq([2,4,5,7,9,11,12,14,12,11,9,7,5,4,2,0]);
mod = -15;
Pbind(\instrument, \ringMod, \carNote, cars, \modNote, mod, \dur, 1/4).play;
)