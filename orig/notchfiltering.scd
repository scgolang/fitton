/*** notchfiltering.scd: filtering mains hum with a notch filter ***/
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
r = {BRF.ar(PlayBuf.ar(1, b), 60, 2)}.play;
r.release; b.close; b.free