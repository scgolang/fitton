/*** playsynths.scd: playing audio with synths ***/
(
SynthDef(\sinewave, {
|freq1=440, freq2=440, amp1=0.5, amp2=0.5|
var sine1, sine2, output;
sine1 = SinOsc.ar(freq1, mul:amp1);
sine2 = SinOsc.ar(freq2, mul:amp2);
output = sine1 + sine2;
Out.ar(0, output);
}).add;
)
(
var amp = 1/4;
y = Synth(\sinewave, [\amp1, amp, \amp2, amp, \freq2, 550]);
x = Synth(\sinewave, [\amp1, amp, \freq1, 660, \amp2, amp, \freq2, 770]);
)
x.free; y.free;