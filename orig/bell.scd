/*** bell.scd: a bell sound using additive synthesis ***/
(
SynthDef (\bell, {|fund=440, dur=1|
var freqs, offsets, amps, durs, env, envBell, mixer;
freqs = [0.58, 0.58, 0.91, 0.91, 1.6, 1.2, 2, 2.7, 3, 3.75, 4.09];
offsets = [0, 1, 0, 1.7, 0, 0, 0, 0, 0, 0, 0];
amps = [1, 0.67, 1, 1.8, 1.67, 2.67, 1.46, 1.33, 1.33, 1, 1.33].normalizeSum;
durs = [1, 0.9, 0.65, 0.55, 0.35, 0.325, 0.25, 0.2, 0.15, 0.1, 0.075];
mixer = Mix.fill(freqs.size, {|i|
var amp, freq;
freq = fund*freqs[i]+offsets[i];
amp = amps[i];
env = EnvGen.kr(Env.perc(releaseTime:dur*durs[i]-0.01));
SinOsc.ar(freq, mul:amp*env)
});
envBell = EnvGen.kr(Env.perc(releaseTime:dur-0.01), doneAction:2);
Out.ar(0, mixer*envBell)
}).add;
)
Synth(\bell, [\dur, 10, \fund, 440]);