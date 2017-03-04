/*** amtremolo.scd: tremolo = amplitude modulation at subaudio rate ***/
(
SynthDef (\am, {|modFreq=200, carFreq=500, dur=1, amp=1|
var mod, car, env;
mod = SinOsc.ar(modFreq, 3pi/2, 1/2, 1/2);
car = SinOsc.ar(carFreq);
env = EnvGen.kr(Env.linen(dur*0.05, dur*0.9, dur*0.05, amp, \sine), doneAction:2);
OffsetOut.ar(0, car*mod*env);
}).add;
)
(
var freqs, durs, amps, mods;
freqs = Pseq([72, 67, [69, 72, 76, 79], 0, [67, 70, 74, 77], [67, 71, 74, 77], [69, 72, 76, 79], 0]).midicps;
durs = Pseq([1, 1, 2/3, Rest(1/3), 1/2, 1/3, 2, Rest(1/6)]);
amps = Pseq([1, 1, 1/4, 1, 1/4, 1/4, 1/4, 1]);
mods = Pseq((6!6)++(3!2));
Pbind(\instrument, \am,
\modFreq, mods,
\carFreq, freqs,
\dur, durs,
\amp, amps
).play;
)