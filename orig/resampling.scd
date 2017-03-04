/*** resampling.scd: sample rate conversion ***/
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
x = {PlayBuf.ar(b.numChannels, b.bufnum, BufRateScale.ir(b.bufnum))}.play;
x.release; b.close; b.free;