/*    AAAAAAAAAAAAAAAAAAAAAAAAAAAAA     */

(//music A - start!!!
var music_A_fadeTime = 10.0;
~masterEQ.gui.onSelect('music_a');
~g1.stop;~g2.stop;~g3.stop;
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~amp_music_a = 3.5;
~music_A = Pdef(\seq_music_a,
	Pbind(
		\instrument, \woong,
		\dur, Pseq([
			Pseq([1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\freq2, Pseq([
						Pseq(([108, 105, 105, 105]).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd2).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd2).midicps, 1),
			], inf),
		\freq3, Pseq([
						Pseq(([108, 105, 105, 105]).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd3).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd3).midicps, 1),
			], inf),
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1, 1, 1, 1]/9, 1), // original
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25]/9, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1]/9, 1),
			], inf),
		// \sn, Pseq((80..8), 1),
		// \sn, 1,
		\sn, 8,
		// \sn, Pseq([8, 100, 8, 8, 800, Prand([500, 300, 2], 1), 8, 8], inf),
		\amp, 0.9*~amp_music_a,
		// \cutoff, 400,
		\cutoff, Pseq([100, 200, 400, 600, 500, 200, 1800, 200]/4, inf),
		// \cutoff, Pseq([100, 200, 400, 200, 500, 200, 500, 500], inf),
		\rq, 0.9

	)
// ).quant_(4).play;
	).quant_(0).play;
~music_A.fadeTime = music_A_fadeTime;

)

(//music A - fadeOut
var music_A_fadeTime = 10.0;
~masterEQ.gui.onSelect('music_a');
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~amp_music_a = 0;
~music_A = Pdef(\seq_music_a,
	Pbind(
		\instrument, \woong,
		\dur, Pseq([
			Pseq([1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\freq2, Pseq([
						Pseq(([108, 105, 105, 105]).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd2).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd2).midicps, 1),
			], inf),
		\freq3, Pseq([
						Pseq(([108, 105, 105, 105]).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd3).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd3).midicps, 1),
			], inf),
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1, 1, 1, 1]/9, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25]/9, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1]/9, 1),
			], inf),
		// \sn, Pseq((80..8), 1),
		// \sn, 1,
		\sn, 8,
		// \sn, Pseq([8, 100, 8, 8, 800, Prand([500, 300, 2], 1), 8, 8], inf),
		\amp, 0.9*~amp_music_a,
		// \cutoff, 400,
		\cutoff, Pseq([100, 200, 400, 600, 500, 200, 1800, 200]/4, inf),
		// \cutoff, Pseq([100, 200, 400, 200, 500, 200, 500, 500], inf),
		\rq, 0.9

	)
// ).quant_(4).play;
	).quant_(0).play;
~music_A.fadeTime = music_A_fadeTime;

)



/*    BBBBBBBBBBBBBBBBBBBBBBBBB     */
(//music B start

var music_B_fadeTime = 10.0;
~music_A.stop;
~masterEQ.gui.onSelect('music_b');
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~amp_music_b = 1.5;

~music_B_1 = Pdef(\seq_long,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			// Pseq([1, 1, 1, 1, 0.5, 0.5]/16, 1),
			Pseq([1, 1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]-12-12).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1, 1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 1.0*~amp_music_b,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff, Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
		], inf),
		// \cutoff, 500,
		\rq, 0.9,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_1.fadeTime = music_B_fadeTime;



~music_B_2 = Pdef(\seq_long2,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1, 3]/6, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1, 6]/2, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.2/2/2*~amp_music_b,
		// \amp, 0,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff,
		Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			// Pseq([500, 450], 1),
		// Ppar([
			// Pseq([500, 420, 350]+240, 1),
			Pseq([500, 420, 350], 1),
			// Pseq([500, 450], 1),
		// ], inf),
			], inf),
		// \cutoff, 500,
		\rq, 0.3,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_2.fadeTime = music_B_fadeTime;



~music_B_3 = Pdef(\seq_long3,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.03/2*~amp_music_b,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff,
		Pseq([
			Pseq([100, 50]*30, 1),
		], inf),
		// \cutoff, 500,
		\rq, 1.0,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_3.fadeTime = music_B_fadeTime;



)


(// music B fade out
var music_B_fadeTime = 10.0;
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~amp_music_b = 0;

~music_B_1 = Pdef(\seq_long,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			// Pseq([1, 1, 1, 1, 0.5, 0.5]/16, 1),
			Pseq([1, 1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]-12-12).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1, 1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 1.0*~amp_music_b,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff, Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
		], inf),
		// \cutoff, 500,
		\rq, 0.9,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_1.fadeTime = music_B_fadeTime;



~music_B_2 = Pdef(\seq_long2,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1, 3]/6, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1, 6]/2, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.2/2/2*~amp_music_b,
		// \amp, 0,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff,
		Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			// Pseq([500, 450], 1),
		// Ppar([
			// Pseq([500, 420, 350]+240, 1),
			Pseq([500, 420, 350], 1),
			// Pseq([500, 450], 1),
		// ], inf),
			], inf),
		// \cutoff, 500,
		\rq, 0.3,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_2.fadeTime = music_B_fadeTime;



~music_B_3 = Pdef(\seq_long3,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.03/2*~amp_music_b,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff,
		Pseq([
			Pseq([100, 50]*30, 1),
		], inf),
		// \cutoff, 500,
		\rq, 1.0,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_3.fadeTime = music_B_fadeTime;



)