(// sf 느낌
~amp_mor_a = 0.1/2;
~freqAdd = 3;
~freq4 = 112;

~c3 = Pdef(\seq_mor_3,
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
		\amp, ~amp_mor_a

	)
).quant_(0).play;


~c2 = Pdef(\seq_mor_2,
	Pbind(
		\instrument, \sori,
		\dur, Pseq([
			// Pseq([Rest(0.25)], 7*8),
			Pseq([0.25], inf),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 2, 2], 1),
		], inf),
		\freq, Pseq([
			Pseq(([49, 56, 49, 56, 49, 44, 44]+24).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+3).midicps, 1),
		], inf),
		\freq4, Pseq([
			Pseq([5], 7*4),
			Pseq([20], 7*4),
			Pseq([30], 7*4),
			Pseq([
				Pseq([40], 7*4),
				Pseq([90], 7*4),
				Pseq([50], 7*4),
				Pseq([80], 7*4),
				Pseq([50], 7*2),
			], inf),
		], inf),
		\delta, Pseq([
			Pseq([0.25], 1),
		], inf),
		\amp, ~amp_mor_a/3

	)
).quant_(0).play;


)