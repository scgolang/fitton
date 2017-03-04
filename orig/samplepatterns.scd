/*** samplepatterns.scd: sample patterns ***/
Pseq([(degree:3)]).play
Pseq([(degree:0), (degree:[0,3]), (degree:[0,3,5])]).play
Pbind(\degree, Pseq([0,3,5])).play
Pbind(\degree, Pseq([[0,3,5], [0,3b,5], [0,3,5s]])).play
Pbind(\note, Pseq((0..12).scramble, 4), \dur, (1/8)).play