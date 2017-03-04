/*** arpeggiosandchordspattern.scd: arpeggios and chords pattern ***/
(
var score;
j = [0,4,7,12];
k = [0,3,7,12];
score = j++j++(k-3)++(k-3)++(j-7)++(j-7)++[j-5]++[j-5];
Pbind(
\note, Pseq(score),
\dur, Pseq((1/4!24)++(1!2))
).play;
)