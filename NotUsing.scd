만들어 졌으나 사용하지 않은 것들 모음


// ~m5 = Pdef(\seq_med_5,
// 	Pbind(
// 		\instrument, \liedR,
// 		\freq, Pseq([
// 			Pseq(([0, 70, 72, 73, 68, 66, 65]-4).midicps, 1)
// 		], inf),
// 		\toneLow, 4,
// 		\toneGain, 0.2,
// 		\atk, 0.1,
// 		\dur, Pseq([Rest(1), 1, 1, 1, 3, 1, 2], inf),
// 		// \dur, 2,
// 		\delta, Pseq([1, 1, 1, 1, 3, 1, 4], inf), // 박이 끝나는 부분이 일치
// 		// \delta, Pseq([2], inf), // 박이 끝나는 부분이 일치
// 		// \delta, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 1.5], inf), // 박이 끝나는 부분이 불일치, 페이즈 음악, 돌림노래 같은 느낌
// 		\amp, Pseq([0.9, 0.8, 0.8, 0.9, 1.2]*0.3, inf),
// 		// \amp, 0.9
// 	)
// ).quant_(6).play;

//
// ~m4 = Pdef(\seq_med_4,
// 	Pbind(
// 		\instrument, \liedR,
// 		\freq, Pseq([
// 			Pseq(([54, 52, 54, 57, 55, 54]-12).midicps, 1),
// 			// Pseq(([54, 52, 54, 57, 55, 54]).midicps, 1)
// 		], inf),
// 		\toneLow, 4,
// 		\toneGain, 0.2,
// 		\atk, 0.1,
// 		\dur, Pseq([3.75, 0.25, 4, 3.75, 0.25, 4], inf),
// 		// \dur, 2,
// 		\delta, Pseq([3.5, 0.25, 4.25, 3.5, 0.25, 4.25], inf), // 박이 끝나는 부분이 일치
// 		// \delta, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 1.5], inf), // 박이 끝나는 부분이 불일치, 페이즈 음악, 돌림노래 같은 느낌
// 		\amp, Pseq([0.9, 0.8, 0.8, 0.9, 1.2]*0.5, inf),
// 		// \amp, 0.9
// 	)
// ).quant_(6).play;
//

/* 빰빠라밤 인데 끝나는 부분에 다음 루틴과 연결하는 음이 있는 패턴
Pdef(\seq4,
	Pbind(
		\instrument, \ddd,
		\freq, Pseq(([66, 73, 73, 73, 73, 75, 73]+7).midicps, inf),
		\toneLow, 4,
		\toneGain, 0.2,
		\atk, 0.1,
		// \dur, Pseq([3.5, 0.25, 0.25, 4, 3.5, 0.25, 0.25, 0.25, 0.25, 3, 0.5], inf),
		// \dur, 2.0,
		\dur, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 4, 1, 0.5]*2, inf),
		// \dur, 2,
		\delta, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 1.5, 1.0, 0.5], inf),
		// \amp, Pseq([0.9, 0.8, 0.8, 0.9, 1.2, 1.0, 0.6]*0.7, inf),
		\amp, 0.0
	)
).quant_(6).play;
*/



// 찰칵찰칵? - 개념 무용 test 해 볼 것
//ambient
(
~spdDiv = 4;

~dd1 = Pdef(\ddd,
	Pbind(
        \instrument,        \chal,
		\freq, Pseq([
			Pseq(([55, 65, 77, 34, 90, 24, 10, 40, 80]*0.8).midicps, 3),
			// Pseq(([#[20], 80, 90, 90, #[30], 80, 90, 80, #[100], #[80], 90, 80, 70]/2).midicps, 1),
		], inf),
        \dur, Pseq([
			Pseq([4, 2, 1, 5, 1, 2, 0.4, 0.2, 0.5]/~spdDiv, 3),
			// Pseq([1, 1, 1, 1,  1, 1, 1, 1,  1, 2, 1,  1, 4]/~spdDiv, 1),
		], inf),
		// \degree,            Pseq( [1, 2, 7, 2, 22, 39, 44]/148, inf),
        \amp,               0.4,
		\freqBase, Pseq(([20]), inf),
		\freqAmp, 0.1,
		\decay, 0.5

    )
).play;

~dd2 = Pdef(\ddd2,
	Pbind(
        \instrument,        \chal,
		\freq, Pseq([
			// Pseq(([55, 65, 77, 34, 90, 24, 10, 40, 80]*0.8).midicps, 3),
			Pseq(([#[20], 80, 90, 90, #[30], 80, 90, 80, #[100], #[80], 90, 80, 70]/2).midicps, 1),
		], inf),
        \dur, Pseq([
			// Pseq([4, 2, 1, 5, 1, 2, 0.4, 0.2, 0.5]/~spdDiv, 3),
			Pseq([1, 1, 1, 1,  1, 1, 1, 1,  1, 2, 1,  1, 4]/~spdDiv, 1),
		], inf),
		// \degree,            Pseq( [1, 2, 7, 2, 22, 39, 44]/148, inf),
        \amp,               0.4,
		\freqBase, Pseq(([20]), inf),
		\freqAmp, 0.1,
		\decay, 0.5

    )
).play;
)
