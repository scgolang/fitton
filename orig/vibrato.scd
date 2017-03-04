/*** vibrato.scd: frequency modulation at subaudio rate (vibrato) ***/
(
{
var env, mod, car, modfreq=6, index=4, carfreq=440;
env = EnvGen.kr(Env.linen(0.2, 0, 1.8), doneAction:2);
mod = SinOsc.ar(modfreq, mul:modfreq*index);
car = SinOsc.ar(carfreq+mod, mul:env);
}.play
)