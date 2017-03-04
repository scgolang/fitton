/*** glissando.scd: glissando effects ***/
{SinOsc.ar(XLine.ar(440, 330, 1), mul:-3.dbamp)}.play;
{SinOsc.ar(EnvGen.ar(Env([220, 440, 330], [1, 1]*0.707, \exp)))}.play;