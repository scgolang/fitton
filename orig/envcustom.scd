/*** envcustom.scd: creating custom envelopes ***/
(
var envtri, dur=2;
envtri = Env([0.01, 0.707, 0.01], [dur/2, dur/2], \exp);
envtri.test.plot;
)
(
var envadsr, dur=2;
envadsr = Env([0, 0.707, 0.65, 0.4, 0], [1/64, 3/32, 14/16, 1/64]*dur, -4);
envadsr.test.plot;
)