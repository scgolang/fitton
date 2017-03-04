/*** chorus.scd: chorus effect by variably tapping a delay line ***/
a = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
b = Buffer.alloc(s, a.numFrames, a.numChannels);
(
SynthDef(\flanger, {|bufsrc=0, bufdest=1, delaymin=0.02, delaymax=0.05, dur=5|
var mod, src, tap, output;
mod = EnvGen.ar(Env([delaymin, delaymax, delaymin], [dur/2, dur/2], \exp), doneAction:2);
src = PlayBuf.ar(bufdest.numChannels, bufsrc, loop:1);
tap = CombC.ar(src, delaymax, mod, 0);
output = Mix.ar([src, tap]);
Out.ar(0, output)
}).add
)
x = Synth(\flanger, [\bufsrc, a, \bufdest, b]);
a.close; a.free; b.close; b.free;