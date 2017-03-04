/*** compand.scd: amplitude compression and expansion ***/
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
(
r=Routine{|buff=0|
var dur, thresh, ratio, in, compress, expand;
dur = buff.duration;
thresh = (-40).dbamp;
ratio = 4;
in = {PlayBuf.ar(1, buff, BufRateScale.ir(buff), doneAction:2)};
in.play; dur.wait;
compress = {Compander.ar(in, in, thresh, 1, 1/ratio, 0.01, 0.01)};
compress.play; dur.wait;
expand = {Compander.ar(compress, compress, thresh, 1, ratio/1, 0.01, 0.01)};
expand.play;
}
)
Routine{r.reset; 3.do{r.(b); b.duration.wait}}.play;