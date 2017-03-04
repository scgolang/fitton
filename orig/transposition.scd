/*** transposition.scd: transposition ***/
b=Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
(
SynthDef (\monoSampleTransposer, {|bufnum=0, tpose=0|
var rate, ptr, output;
rate = BufRateScale.ir(bufnum)*pow(2, tpose/12);
ptr = Phasor.ar(0, rate, 0, BufFrames.ir(bufnum));
output = BufRd.ar(1, bufnum, ptr, 1, 4);
Out.ar(0, output)
}).add;
)
y = Synth(\monoSampleTransposer, [\bufnum, b.bufnum]);
(
var tpose = 1;
y.set(\tpose, tpose);
)
y.free; b.close; b.free;