/*** beating.scd: mixing signals of nearly the same frequency ***/
(
var freq = {XLine.kr(400, 440, 10)};
{SinOsc.ar([440, freq], mul:-3.dbamp)}.play;
)