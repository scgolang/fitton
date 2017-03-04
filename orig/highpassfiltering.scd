/*** highpassfiltering.scd: high pass filtering ***/
(
var in, out, order=4, cutoff=1000, dur=2;
in = {WhiteNoise.ar(EnvGen.ar(Env.linen(0.01, dur-0.02, 0.01), doneAction:2))};
out = Array.fill(order+1, {|i| if(i>0, {{HPF.ar(out[i-1], cutoff)}}, {in})});
Routine{(order+1).do{|i| {out[i]}.play; dur.wait}}.play
)