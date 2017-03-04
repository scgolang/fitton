/*** pitchconversion.scd: pitch conversion methods ***/
{SinOsc.ar(440)}.play;
{SinOsc.ar(midicps(69))}.play;
{SinOsc.ar(octcps(4.75))}.play;
(
var amaj, amp;
amaj = [60, 64, 67, 72].midicps;
amp = 0.707/amaj.size;
{SinOsc.ar(amaj[0], mul:amp)}.play;
{SinOsc.ar(amaj[1], mul:amp)}.play;
{SinOsc.ar(amaj[2], mul:amp)}.play;
{SinOsc.ar(amaj[3], mul:amp)}.play;
)