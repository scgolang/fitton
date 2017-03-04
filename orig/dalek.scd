/*** dalek.scd: Daleks! complex RM with a 30Hz modulator ***/
(
o = {
var mod = SinOsc.ar(30);
b = Buffer.cueSoundFile(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav", 0, 1, pow(2,16));
c = DiskIn.ar(1, b.bufnum, 1);
c*mod;
}.play;
)
c.release; b.close; b.free; o.free;