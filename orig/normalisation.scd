/*** normalisation.scd: normalising a compressed signal ***/
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
(
r=Routine{|buff=0|
var dur, thresh, ratio, headroom, in, compress, normal;
dur = buff.duration;
thresh = -40.dbamp;
ratio = 4;
headroom = -3.dbamp;
in = {LeakDC.ar(PlayBuf.ar(1, buff, BufRateScale.ir(buff), doneAction:2))};
in.play; dur.wait;
compress = {Compander.ar(in, in, thresh, 1, 1/ratio, 0.01, 0.01)};
compress.play; dur.wait;
normal = {Normalizer.ar(compress, headroom)};
normal.play;
}
)
Routine{r.reset; 3.do{r.(b); b.duration.wait}}.play;