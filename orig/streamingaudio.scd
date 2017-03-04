/*** streamingaudio.scd: streaming audio***/
(
b = Buffer.cueSoundFile(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav", 0, 1, pow(2,16));
p = {DiskIn.ar(1, b, 1)}.play;
)
p.release; b.close; b.free;