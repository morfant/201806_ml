2막 꼬이는 부분 음악?





// define synth
(
SynthDef(\gobeat, {|freq = 240, dur = 0.2, gate = 1, amp = 0.5|
	// var env = Line.kr(0.2, 0.0, dur, doneAction:2);
	var env = EnvGen.kr(Env.perc(0.01, dur), gate, doneAction: 2);
	var sig = SinOsc.ar(freq, 0, env);
	Out.ar(0, Pan2.ar(sig)*amp);
}).add;

SynthDef(\sine, {|freq = 240, dur = 0.2, gate = 1, atk = 0.1, amp = 0.5|
	// var env = EnvGen.kr(Env.perc(atk, dur), gate, doneAction: 2);
	var env = Line.kr(0.2, 0.0, dur, doneAction:2);
	var sig = SinOsc.ar(freq, 0, env);
	var sig2 = SinOsc.kr(freq/4, mul: env);
	var no = WhiteNoise.ar(env) * 0.005 * LFTri.kr(80, mul: 0.4);
	Out.ar(0, Pan2.ar(sig*sig2+no)*amp);
}).add;

SynthDef(\ddd, {|freq = 240, dur = 0.2, gate = 1, atk = 0.1, amp = 0.5, toneLow = 7, toneGain = 0.3|
	var env = EnvGen.kr(Env.perc(atk, dur), gate, doneAction: 2);
	var sig2 = SinOsc.kr(freq/toneLow, mul: toneGain);
	var sig = SinOsc.ar(freq*sig2, pi/6);
	var no = WhiteNoise.ar(0.005) * LFTri.kr(80, mul: 0.4);
	Out.ar(0, Pan2.ar((sig+no)*env)*amp);
}).add;
)


a = Synth(\ddd, [\dur, 2.0]);
a = Synth(\sine, [\dur, 2.0]);



// call synth!
Synth(\gobeat);
Synth(\gobeat, [freq: 660, dur: 2.0, amp:0.1]);
Synth(\gobeat, [freq: 69.midicps, dur: 2.0]);


Synth(\ddd);


//change tempo
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.


// ======================================= Lang side Sequence ===========================================
// Routine(Tdef)
(
Routine{
	inf.do{
		Synth(\gobeat, [freq: ([50, 53, 52]).midicps, dur: 1.4]);
		2.0.wait; // not sec, but beat
	}
}.play;
)

// Tdef for hotswap to code - for live coding :
/*
\seq1 은 key 값 - 실행 되는 중에 다시 실행하면 전의 것은 종료 되고 변경된 것으로 업데이트
*/
(
Tdef(\seq1, {
	inf.do{
		Synth(\gobeat, [freq: [52, 54, 52].midicps, dur: 1.4]);
		1.0.wait;
}}).play;
)

// sync with Tdefs
(
Tdef(\seq1, {
	inf.do{
		Synth(\gobeat, [freq: [48,55,60,64,67,81].choose.midicps, dur: 1.4]);
        // send osc
        // insert algorithm
        // push led
        //...
		1.0.wait;

}}).play(quant:4);
)

(
Tdef(\seq2, {
	inf.do{
		Synth(\gobeat, [freq: 64.midicps, dur: 0.5]);
		1.0.wait;
}}).play(quant:4);
)


(
Tdef(\seq3, {
	inf.do{
		Synth(\sine, [freq: 58.midicps, dur: 0.5]);
		1.0.wait;
}}).play(quant:4);
)


/* ---- ---- ---- ---- */

(
Pdef(\seq1,
	Pbind(
		\instrument, \sine,
        \freq, Pseq([80, 64, 67, Prand([70, 63], 1), 71]-16, inf).midicps,
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		\dur, Pseq([0.1, 0.2, 0.5], inf),
		// \dur, 1.2,
		\delta, 0.5
	)
).quant_(4).play;
)



(// 고대 비트
~amp_a = 0.1;
~amp_b = 0.2;
~amp_c = 0.2;
~key_diff = 0;

~p1 = Pdef(\seq1,
	Pbind(
		\instrument, \gobeat,
        \freq, Pseq([52, 52, 52, 71], inf).midicps,
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		\dur, Pseq([0.4, 0.1, 0.1], inf),
		// \dur, 1.2,
		\delta, 0.5,
		\amp, ~amp_a

	)
).quant_(4).play;


~p2 = Pdef(\seq2,
	Pbind(
		\instrument, \gobeat,
        //\freq, Pseq([69, 69, 69]-5, inf).midicps,
		\freq, Pseq([69, 69, 69]-5, inf).midicps,
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		\dur, Pseq([1.0, 0.25, 0.75], inf),
		// \dur, 1.2,
		\delta, Pseq([0.75, 0.25, 1], inf),
		\amp, ~amp_b
	)
).quant_(4).play;



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
		\amp, ~amp_c
	)
).quant_(4).play;

)



~p1.play;
~p2.play;
~p3.play;

~p1.stop;
~p2.stop;
~p3.stop;


정아씨 판서 점 찍을 때 중세 음악과 오버랩,


(// 중세 오르간
~m1 = Pdef(\seq1,
	Pbind(
		\instrument, \ddd,
        \freq, Pseq([240, 300, 290]*2, inf),
		\dur, Pseq([0.1, 0.2, 0.5, 0.2, 1.4, 0.1], inf),
		\delta, Pseq([0.5], inf),
		\amp, 0.3
	)
).quant_(6).play;


~m2 = Pdef(\seq2,
	Pbind(
		\instrument, \ddd,
		\freq, Pseq(([66, 64, 63, 64, 66, 64, 63, 64, 63, 59, 61]+24).midicps, inf),
		\toneLow, 7,
		\toneGain, 0.1,
		\atk, 0.3,
		// \dur, Pseq([3.5, 0.25, 0.25, 4, 3.5, 0.25, 0.25, 0.25, 0.25, 3, 0.5], inf),
		// \dur, 2.0,
		\dur, Pseq([2.5, 0.25, 0.25, 3, 2.5, 0.25, 0.25, 0.25, 0.25, 2.5, 0.5]*0.8, inf),
		// \dur, 0.2,
		\delta, Pseq([2.5, 0.25, 0.25, 3, 2.5, 0.25, 0.25, 0.25, 0.25, 2, 0.5], inf),
		\amp, Pseq([0.3, 0.2, 0.2, 0.2, 0.3, 0.1, 0.15, 0.2, 0.15, 0.3, 0.3]*1.5, inf),
		// \amp, 0.1
	)
).quant_(6).play;


~m3 = Pdef(\seq3,
	Pbind(
		\instrument, \ddd,
		\freq, Pseq(([66, 73, 73, 73, 73]+7).midicps, inf),
		\toneLow, 4,
		\toneGain, 0.2,
		\atk, 0.1,
		\dur, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 4]*2, inf),
		// \dur, 2,
		\delta, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 3], inf), // 박이 끝나는 부분이 일치
		\delta, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 1.5], inf), // 박이 끝나는 부분이 불일치, 페이즈 음악, 돌림노래 같은 느낌
		\amp, Pseq([0.9, 0.8, 0.8, 0.9, 1.2]*0.2, inf),
		// \amp, 0.9
	)
).quant_(6).play;


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


)

(
~m1.play;
~m2.play;
~m3.play;
)

(
~m1.stop;
~m2.stop;
~m3.stop;
)


중세 오르간 음악은 태이씨 의자 올라와서 망원경 다 펴고 탑 조명이 들어오면 페이드로 나간다.

그 다음은 모자르트 음악.

"사리야"

베토벤 음악

찰칵찰칵 음악

