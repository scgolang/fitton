/*** bubbles.scd: bubbles ***/

{
CombC.ar(
SinOsc.ar(
LFSaw.ar(0.4,0,24,
LFSaw.ar([8,7.23],0,3,80)).midicps,
0,0.04),0.2,0.2,4)
}.play