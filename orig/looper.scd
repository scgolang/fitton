/*** looper.scd: a looping sampler ***/
b=Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
(
SynthDef(\monolooper, {|bufnum=0, start=0, end=0, tpose=0, mode=1|
var srBuffer, srSample, dir, rate, dur, startPos, endPos, pointer, output;
srBuffer = BufSampleRate.ir(bufnum);
srSample = SampleRate.ir;
dir = Select.kr(mode.sign < 0, [1, -1]);
rate = (srBuffer/srSample)*(2**(tpose/12))*dir;
dur = abs(end-start)/(2**(tpose/12));
startPos = Select.kr(dir.sign < 0, [start*srBuffer, end*srBuffer]);
endPos = Select.kr(dir.sign < 0, [end*srBuffer, start*srBuffer]);
pointer = Phasor.ar(1/dur, rate, startPos, endPos);
output = BufRd.ar(1, bufnum, pointer, 1, 4);
Out.ar(0, output);
}).add;
SynthDef(\stereolooper, {|bufnum=0, start=0, end=0, tpose=0, mode=1|
var srBuffer, srSample, dir, rate, dur, startPos, endPos, pointer, output;
srBuffer = BufSampleRate.ir(bufnum);
srSample = SampleRate.ir;
dir = Select.kr(mode.sign < 0, [1, -1]);
rate = (srBuffer/srSample)*(2**(tpose/12))*dir;
dur = abs(end-start)/(2**(tpose/12));
startPos = Select.kr(dir.sign < 0, [start*srBuffer, end*srBuffer]);
endPos = Select.kr(dir.sign < 0, [end*srBuffer, start*srBuffer]);
pointer = Phasor.ar(1/dur, rate, startPos, endPos);
output = BufRd.ar(2, bufnum, pointer, 1, 4);
Out.ar(0, output!2);
}).add;
)
(
if(b.numChannels>1,
{y = Synth(\stereolooper, [\bufnum, b.bufnum])},
{y = Synth(\monolooper, [\bufnum, b.bufnum])});
)
y.set(\start, 0, \end, 2, \tpose, 0, \mode, 1);
y.free; b.close; b.free;