/*** schroederreverb.scd: Schroeder reverb ***/
(
{
var s, z, y;
s = Mix.ar(Array.fill(10, {Resonz.ar(Dust.ar(0.2, 50), 200+3000.rand, 0.003)}));
z = DelayN.ar(s, 0.048);
y = Mix.ar(Array.fill(7,{CombL.ar(z, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 15)}));
4.do({ y = AllpassN.ar(y, 0.050, [0.050.rand, 0.050.rand], 1) });
s+(0.2*y)
}.play
)