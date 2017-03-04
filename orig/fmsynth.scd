/*** fmsynth.scd: An FM synthesiser ***/
(
SynthDef(\fmsynth, {
|carfreq=440, ratio=1, index=1, dur=1|
var levels, times, env, mod, car;
levels = \levels.ar([0,0,0,0,0]);
times = \times.ar([0,0,0,0]);
env = EnvGen.kr(Env(levels, dur*times), doneAction:2);
mod = SinOsc.ar(carfreq*ratio, mul:carfreq*ratio*index*env);
car = SinOsc.ar(carfreq+mod, mul:env);
Out.ar(0, car*env);
}).add;
)
(
var
notes = 4,
carfreq = [440, 880, 400, 440],
ratio = [1, 1/3, 7/5, 11/3],
index = [5, 2, 10, 4],
dur = 4,
levels=[[0,1,2/3,1/2,0], [0,1,1,0], [0,1,0], [0,1,0]],
times=[[1/12,1/4,1/2,1/6], [1/5,3/5,1/5], [1/600,599/600], [599/600,1/600]];
Routine{
notes.do{|i|
Synth(\fmsynth, [
\carfreq, carfreq[i],
\ratio, ratio[i],
\index, index[i],
\dur, dur,
\levels, levels[i],
\times, times[i],
]);
dur.wait;
}
}.play;
)