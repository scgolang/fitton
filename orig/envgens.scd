/*** envgens.scd: generating amplitude envelopes ***/
({
var dur=2, envtri, trig, envgen, output;
envtri = Env([0.01, 0.707, 0.01], [dur/2, dur/2], \exp);
trig = Impulse.kr(1/dur);
envgen = EnvGen.ar(envtri, trig);
output = SinOsc.ar(mul:envgen);
}.play
)
({
var dur=2, envadsr, gate, envgen, output;
envadsr = Env.adsr(sustainLevel:0.707);
gate = SinOsc.ar(1/dur, mul:1/2);
envgen = EnvGen.ar(envadsr, gate);
output = SinOsc.ar*envgen;
}.play
)