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
		\amp, 1.0,
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
		\amp, 0.2/2/2,
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
		\amp, 0.03/2,
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


(

// game bgm
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~div = 4;
~div2 = ~div/2;
~key = -4;
~key2 = ~key - 16;
~key3 = ~key - 1 + 12;
~fadeOutTime_game = 2.0;



~amp_game_b = 0.25;
~amp_game_c = ~amp_game_b - 0.05;
~amp_game_a = ~amp_game_b - 0.15;
// ~amp_game_a = ~amp_game_b = ~amp_game_c = 0;

~g1 = Pdef(\seq_game_1,
	Pbind(
		// \instrument, \gobeat,
		// \instrument, \lfp,
		\instrument, "help-TCoin",
		\dur, Pseq([
			Pseq([1, 1, 1, 1, 1, 1, 1, 1]*0.7, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([59, 64, 63, 66, 59, 64, 63, 59]+~key).midicps, 1),
			Pseq([Rest(1/~div)], 8),
			Pseq(([59, 64, 63, 66, 59, 64, 63, 59]-2+~key).midicps, 1),
			Pseq([Rest(1/~div)], 8),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\delta, Pseq([
			Pseq([1, 1, 1, 1, 1, 1, 1, 1]/~div, 1),
			Pseq([Rest(1/~div)], 8),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, ~amp_game_a,

	)
// ).quant_(4).play;
).quant_(0).play;
// ~g1.fadeTime = ~fadeOutTime_game;

~g2 = Pdef(\seq_game_2,
	Pbind(
		\instrument, \gobeat,
		\dur, Pseq([
			Pseq([1, 1, 1, 1, 1, 1, 1, 1], 2),
			Pseq([1, 1, 1, 1, 1, 1, 1, 0.5, 0.5], 1),
			Pseq([1, 1, 1, 1, 1, 1, 1, 1], 1),
		], inf),
		\freq, Pseq([
			// Pseq(([63]+~key2).midicps, 8),
			// Pseq(([63]-2+~key2).midicps, 8),
			Pseq(([63, 63, 63, 63, 63, 63, 63, 65]+~key2).midicps, 1),
			Pseq(([63]-2+~key2).midicps, 8),
			Pseq(([63, 63, 63, 63, 63, 63, 63, 59, 60]+~key2).midicps, 1),
			Pseq(([63]-2+~key2).midicps, 8),

		], inf),
		\delta, Pseq([
			Pseq([1, 1, 1, 1, 1, 1, 1, 1]/~div2, 2),
			Pseq([1, 1, 1, 1, 1, 1, 1, 0.5, 0.5]/~div2, 1),
			Pseq([1, 1, 1, 1, 1, 1, 1, 1]/~div2, 1),
			], inf),
		\amp, ~amp_game_b,

	)
// ).quant_(4).play;
).quant_(0).play;
~g2.fadeTime = ~fadeOutTime_game;


~g3 = Pdef(\seq_game_3,
	Pbind(
		\instrument, \gobeat,
		// \instrument, "help-TCoin",
		\dur, Pseq([
			// Pseq([1, 1, 1, 1, 1, 1, 1, 1], 1),
			Pseq([1, 1, 1, 1, 1, 1, 1, 1, 1, 0.8, 1.2], 1),
			// Pseq([1, 1, 1, 1, 1, 1, 1, 0.5, 0.5], 1),
			// Pseq([1, 1, 1, 1, 1, 1, 1, 1], 1),
		], inf),
		\freq, Pseq([
			// Pseq(([63]+~key2).midicps, 8),
			// Pseq(([63]-2+~key2).midicps, 8),
			Pseq(([60, 60, 58, 60, 62, 58, 58, 56, 58, 55, 58]+~key3).midicps, 1),
			// Pseq(([60, 60, 58, 60, 62, 58, 58, 56, 58, 58]+~key3).midicps, 1),
			// Pseq(([63]-2+~key2).midicps, 8),
			// Pseq(([63, 63, 63, 63, 63, 63, 63, 59, 60]+~key3).midicps, 1),
			// Pseq(([63]-2+~key2).midicps, 8),

		], inf),
		\delta, Pseq([
			// Pseq([2, 1, 0.5, 3.5, 1, 2, 1, 0.5, 3.5, 1]/~div2, 1),
			Pseq([2, 1, 0.5, 3.5, 1, 2, 1, 0.5, 2.5, 1, 1]/~div2, 1),
			// Pseq([1, 1, 1, 1, 1, 1, 1, 0.5, 0.5]/~div2, 1),
			// Pseq([1, 1, 1, 1, 1, 1, 1, 1]/~div2, 1),
			], inf),
		\amp, ~amp_game_c,

	)
// ).quant_(4).play;
	).quant_(0).play;
~g3.fadeTime = ~fadeOutTime_game;

)


(// fade out
~g1 = Pdef(\seq_game_1, Pbind(\amp, 0.01)).play;
~g2 = Pdef(\seq_game_2, Pbind(\amp, 0.01)).play;
~g3 = Pdef(\seq_game_3, Pbind(\amp, 0.01)).play;
)

// stop
(~g1.stop;~g2.stop;~g3.stop;)



(// fade in
~g1 = Pdef(\seq_game_1, Pbind(\instrument, "help-TCoin", \amp, 0.08)).play;
~g2 = Pdef(\seq_game_2, Pbind(\instrument, \gobeat, \amp, 0.25)).play;
~g3 = Pdef(\seq_game_3, Pbind(\instrument, \gobeat, \amp, 0.1)).play;
)



