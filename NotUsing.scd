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
