(// 고대 시작
~masterEQ.gui.onSelect('ancient');
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~amp_anc_a = 0.1/2;
~amp_anc_b = 0.2/2;
~amp_anc_c = 0.2/2;
// ~amp_anc_a = 0.1;
// ~amp_anc_b = 0.2;
// ~amp_anc_c = 0.2;

~key_diff = 0;

~p1 = Pdef(\seq1,
	Pbind(
		\instrument, \gobeat,
        \freq, Pseq([52, 52, 52, 71], inf).midicps,
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		\dur, Pseq([0.4, 0.1, 0.1], inf),
		// \dur, 1.2,
		\delta, 0.5,
		\amp, ~amp_anc_a

	)
	).quant_(0);
// ).quant_(0);


~p2 = Pdef(\seq2,
	Pbind(
		\instrument, \gobeat,
        //\freq, Pseq([69, 69, 69]-5, inf).midicps,
		\freq, Pseq([69, 69, 69]-5, inf).midicps,
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		\dur, Pseq([1.0, 0.25, 0.75], inf),
		// \dur, 1.2,
		\delta, Pseq([0.75, 0.25, 1], inf),
		\amp, ~amp_anc_b
	)
	).quant_(0);
// ).quant_(0);



~p3 = Pdef(\seq3,
	Pbind(
		\instrument, \gobeat,
        //\freq, Pseq([69, 69, 69]-5, inf).midicps,
//		\freq, Pseq([61, 59, 61, 63, 64, 63, 61, 56, 59, 56], inf).midicps,
		\freq, Pseq([
			Pseq([61, 59, 61, 63, 64, 63, 61, 56, 59, 56]-~key_diff, 1).midicps,
			Pseq([61, 59, 61, 63, 64, 63, 64, 66, 68, 64]-~key_diff, 1).midicps,
			Pseq([61, 59, 61, 63, 64, 63, 61, 56, 59, 56]-~key_diff, 1).midicps,
			Pseq([61, 59, 61, 63, 64, 63, 64, 66, 68, 68]-~key_diff, 1).midicps
		], inf),
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		// \dur, Pseq([0.25], inf), // no sustain
		\dur, 1.2, // sustain
		\delta, Pseq([0.75, 0.25, 0.5, 0.5, 0.75, 0.25, 0.5, 0.5, 0.75, 3.25], inf),
		\amp, ~amp_anc_c
)
	).quant_(0);
// ).quant_(0);

~p1.play;~p2.play;~p3.play;
)