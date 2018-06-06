(// house music for 20 min
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~fadeOutTime_house = 6.0;
~key_house = 0;
~amp_house = 0.3;

// base rytm
~h1 = Pdef(\seq_house_1,
	Pbind(
		// \instrument, \sori,
		// \instrument, \gobeat,
		\instrument, "help-TCoin_house",
		\dur, Pseq([
			Pseq([2, 1, 1]*1.1, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([71, 68, 64]+~key_house).midicps, 4),
			Pseq(([71, 68, 65]+~key_house-2).midicps, 4),
		], inf),
		// \atkTime, Pseq([0.01], inf),
		// \relTIme, Pseq([0.02], inf),
		\freq_am, 0.1,
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([2, 1, 1]/1, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		\amp, Pseq([0.4, 0.3, 0.24]*~amp_house, inf),
		// \amp, 0.5

	)
// ).quant_(4).play;
).quant_(0).play;
~h1.fadeTime = ~fadeOutTime_house;



~h2 = Pdef(\seq_house_2,
	Pbind(
		// \instrument, \sori,
		// \instrument, \gobeat,
		\instrument, "help-TCoin_house",
		\dur, Pseq([
			Pseq([2, 1, 1]*0.7, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([71, 68, 64]).midicps, 4),
			Pseq(([71, 68, 65]+~key_house-2).midicps, 4),
		], inf),
		// \atkTime, Pseq([0.01], inf),
		// \relTIme, Pseq([0.02], inf),
		\freq_am, 0.1,
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([2, 1, 1]*(1-0.01), 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		\amp, Pseq([0.4, 0.3, 0.24]*~amp_house, inf),
		// \amp, 0.5

	)
// ).quant_(4).play;
).quant_(0).play;
~h2.fadeTime = ~fadeOutTime_house;
)