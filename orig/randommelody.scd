/*** randommelody.scd: creating random melody ***/
(
var maj, min, chr, lotto;
maj = [0, 2, 4, 5, 7, 9, 11].scramble;
min = [0, 2, 3, 5, 6, 9, 11].scramble;
chr = (0..11).scramble.keep(7);
lotto = Scale.choose.postln.semitones.postln;
Pbind(
\note, Pseq(maj++min++chr++lotto),
\dur, 1/5,
).play
)