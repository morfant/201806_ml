a = Synth(\sori, [\freq, 108.midicps, \amp, 0.2]);

(

//music A
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

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
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		// \sn, Pseq((80..8), 1),
		// \sn, 100,
		\sn, 8,
		// \sn, Pseq([8, 100, 8, 8, 800, Prand([500, 300, 2], 1), 8, 8], inf),
		\amp, 0.9,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		\cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\rq, 0.5

	)
// ).quant_(4).play;
	).quant_(0).play;

)



//music B
(
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~music = Pdef(\seq_long,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1, 1, 1]/16, 1),
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
		\amp, 0.9,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff, Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
		], inf),
		// \cutoff, 500,
		\rq, 0.9,


	)
// ).quant_(4).play;
	).quant_(0).play;



~music2 = Pdef(\seq_long2,
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
		\amp, 0.1/2/2,
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
				Pseq([500, 420, 350], 1),
			// Pseq([500, 450], 1),
		// ], inf),
			], inf),
		// \cutoff, 500,
		\rq, 0.3,


	)
// ).quant_(4).play;
	).quant_(0).play;



~music3 = Pdef(\seq_long3,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1]/2, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.01/2,
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




)

Ppar


(

TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~music = Pdef(\seq_fast_1,
	Pbind(
		// \instrument, \sori,
		// \instrument, \dirac,
		// \instrument, \chal,
		\instrument, \woonglong,
		\pos, 0,
		\dur, Pseq([
			Pseq([1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]-12-12).midicps, 1),
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
						Pseq([1, 1, 1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		// \sn, Pseq((80..8), 1),
		// \sn, 100,
		\sn, 8,
		// \sn, Pseq([8, 100, 8, 8, 800, Prand([500, 300, 2], 1), 8, 8], inf),
		\amp, 0.9,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		// \cutoff, 500,
		\rq, 0.5,
		\decay, 0.5,
		\freqBase, Pseq(([55, 56, 89, 88, 85, 43 ]).midicps, inf),
		\ampBase, 0.9,

	)
// ).quant_(4).play;
	).quant_(0).play;

)
~c1.fadeTime = ~fadeOutTime_mod;


// high chord
~c2 = Pdef(\seq_mod_2,
	Pbind(
		\instrument, \woong,
		\dur, Pseq([
			Pseq([0.25], 1),
		], inf),
		\freq, Pseq([
			Pseq([
				Pseq(([90]+~freqAdd).midicps, 8*4),
				Pseq(([80]+~freqAdd).midicps, 8*4),
				Pseq(([60]+~freqAdd).midicps, 8*4),
				Pseq(([83]+~freqAdd).midicps, 8*4),
				Pseq(([70]+~freqAdd).midicps, 8*4),
			], inf),
		], inf),
		\freq2, Pseq([
			Pseq(([90]+~freqAdd2).midicps, 1),
		], inf),
		\freq3, Pseq([
			Pseq(([90]+~freqAdd3).midicps, 1),
		], inf),
		\freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([0.25], 1),
		], inf),
		// \sn, Pseq((80..8), 1),
		\sn, Pseq([
			// Pseq(([100]).midicps, 8*2),
			// Pseq(([60]).midicps, 8*2),
			// Pseq(([50]).midicps, 8*2),
			Pseq(([1]).midicps, 8*2),
		], inf),
		\amp, ~amp_mod_a

	)
// ).quant_(4).play;
).quant_(0).play;
~c2.fadeTime = ~fadeOutTime_mod;

// base rytm
~c3 = Pdef(\seq_mod_3,
	Pbind(
		\instrument, \sori,
		\dur, Pseq([
			Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd).midicps, 1),
			Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		\amp, ~amp_mod_a/6

	)
// ).quant_(4).play;
).quant_(0).play;
~c3.fadeTime = ~fadeOutTime_mod;
)