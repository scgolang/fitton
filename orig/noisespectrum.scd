/*** noisespectrum.scd: colours of noise ***/
{WhiteNoise.ar}.play
{PinkNoise.ar}.play
{BrownNoise.ar}.play
{GrayNoise.ar}.play
(
{
var env = EnvGen.kr(Env([0.001, 1, 0.001], [2.5, 7.5], \exp), doneAction:2);
PinkNoise.ar(env)
}.play
)