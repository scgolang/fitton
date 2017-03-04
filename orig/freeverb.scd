/*** freeverb.scd: reverberation using FreeVerb ***/
(
z = ({
var in, reverb;
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
in = PlayBuf.ar(1, b, loop:1);
reverb = FreeVerb.ar(in);
}.play
)
)
z.free; b.close; b.free;