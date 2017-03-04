/*** bandpass.scd: band pass filtering ***/
(
var in, out, rq, cutoff=1000, dur=2;
in = {WhiteNoise.ar(EnvGen.ar(Env.linen(0.01, dur-0.02, 0.01), doneAction:2))};
rq = [0.1, 0.2, 0.4, 0.5, 1];
Routine{(rq.size).do{|i| {BPF.ar(in, cutoff, rq[i])}.play; dur.wait}}.play
)