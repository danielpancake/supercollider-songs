(
{
	/*
	Satin Panties - Friday Night Funkin'
	
	MIDI by Dario D'aversa
	Coded by danielpancake
	*/

	var intro = Pseq([1, 1, 1, 0.5, 1, 0.5, 1, 1, 0.5, 0.5], 2);
	var intro_notes = Pseq([Pn(13, 10), Pn(1, 10)]);

	var atmp = Pseq([1, 1, 0.5, 1, 1, 0.5, 1]);
	var a = Pseq([atmp, 0.5, 1.5, atmp, 2], 2);
	var atmp_notes = Pseq([5, 6, 5, 6, 5, 3, 5]);
	var a_notes = Pseq([atmp_notes, 1, 1, atmp_notes, 3], 2);

	var b = Pseq([0.5, 0.5, 1, 0.5, 0.5, 1.5, 0.5, 1, 1, 1.5, 1, 0.5, 0.5, 0.5, 1.5, 0.5, 0.5, 0.5, 1]);
	var b_notes = Pseq([3, 3, 5, 3, 1, 8, 6, 5, 3, 5, Pn(1, 4), 8, 6, 5, 3, 1]);

	var c = Pseq([Pn(1, 5), 2, Pn(1, 6), 2, 2, 1, 0.5, 0.5, 2, 2, 2, 2, 1, 2]);
	var c_notes = Pseq([13, 17, 15, 13, 12, 10, 10, 13, 17, 15, 13, 12, 13, 10, 15, 15, 15, 10, 8, 10, 12, 13, 12]);

	var dtmp = Pseq([0.5, 0.5, 1, 1, 0.5, 0.5, 1, 0.5, 0.5, 2, 0.5, 0.5, 1, 1, 0.5, 0.5, 0.5, 0.5]);
	var d = Pseq([dtmp, 0.5, 0.5, 0.5, 1.5, dtmp, 0.5, 0.5, 2, dtmp, 0.5, 0.5, 0.5, 1.5, dtmp, 0.5, 0.5, 0.5, 1.5]);
	var dtmp_notes = Pseq([0, 1, 5, 1, 0, 1, 0, 1, 3, 1, 1, 3, 8, 1, 8, 6, 5, 3]);
	var d_notes = Pseq([dtmp_notes + 12, 18, 17, 15, 13, dtmp_notes, 5, 8, 5, dtmp_notes + 12, 18, 17, 15, 13, dtmp_notes, 6, 5, 3, 1]);

	var e = Pseq([Pn(0.5, 6), 1, 1, 1, 2, Pn(0.5, 4), Pn(1, 4)]);
	var e_notes = Pseq([8, 6, 5, 3, 1, 0, 1, 1, 3, 5, 6, 5, 3, 1, 0, 1, 0, 1]);

	var outro = Pseq([1, 1, 1, 0.5, 1, 1, 0.5, 1, 0.5, 1.5, 1, 1, 0.5, 1, 1, 0.5, 0.5, 0.5, 1, 2]);
	var outro_notes = Pseq([3, 5, 6, 5, 6, 5, 3, 5, 1, 1, 5, 6, 5, 6, 5, 3, 5, 8, 3, 10]);

	// TODO: add bass and percussion

	var song = Pseq([intro, 1, a, b, 1, b, 3, c, d, e, 1, 1, e, 1, 3, c, d, outro]);
	var song_notes = Pseq([intro_notes, -100, a_notes, b_notes + 12, 15, b_notes, 15, c_notes, d_notes, e_notes + 12, 15, 13, e_notes, 8, 15, c_notes, d_notes, outro_notes]);

	SynthDef(\demon, { |amp=0.75, freq=440|
		var snd = LFPulse.ar(freq)!2;
		snd = snd * EnvGen.ar(Env.linen(0.001, 0.12, 0.03));
		OffsetOut.ar(0, snd * amp);
	}).add;

	Pdef(\voice1, Pbind(
		\instrument, \demon,
		\dur, song / 3.65,
		\midinote, song_notes + 59, // Shifting [1] => C4
	)).play;
}.value
)