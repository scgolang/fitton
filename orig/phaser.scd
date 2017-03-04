/*** phaser.scd: phasing ***/
(
{
var dry, mod, wet, output;
dry = Blip.ar(100, 110, 1/2);
mod = EnvGen.ar(Env([11000, 100, 11000], [5/2, 5/2], \exp), doneAction:2);
wet = BAllPass.ar(dry, mod);
2.do{wet = BAllPass.ar(wet, mod)};
output = Pan2.ar((dry+wet)!2, [-1, 1]).sum;
}.play
)
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
(
{
var dry, mod, wet, output;
dry = PlayBuf.ar(1, b, BufRateScale.ir(b), loop:1);
mod = SinOsc.ar(1/10).exprange(100, 11000);
wet = BAllPass.ar(dry, mod);
output = (dry+wet)/2;
}.play
)