
// define synth
(
SynthDef(\gobeat, {|freq = 240, dur = 0.2, gate = 1, amp = 0.5|
	// var env = Line.kr(0.2, 0.0, dur, doneAction:2);
	var env = EnvGen.kr(Env.perc(0.01, dur), gate, doneAction: 2);
	var sig = SinOsc.ar(freq, 0, env);
	Out.ar(0, Pan2.ar(sig)*amp);
}).add;
)

(
SynthDef(\sine, {|freq = 240, dur = 0.2, gate = 1, atk = 0.1, amp = 0.5|
	// var env = EnvGen.kr(Env.perc(atk, dur), gate, doneAction: 2);
	var env = Line.kr(0.2, 0.0, dur, doneAction:2);
	var sig = SinOsc.ar(freq, 0, env);
	var sig2 = SinOsc.kr(freq/4, mul: env);
	var no = WhiteNoise.ar(env) * 0.005 * LFTri.kr(80, mul: 0.4);
	Out.ar(0, Pan2.ar(sig*sig2+no), amp);
}).add;
)


(
SynthDef(\ddd, {|freq = 240, dur = 0.2, gate = 1, atk = 0.1|
	var env = Line.kr(0.0, 1, dur, doneAction:2);
	var sig = SinOsc.kr(freq, pi, env);
	var sig2 = SinOsc.ar(freq/4 * sig , mul: env);
	var no = WhiteNoise.ar(env) * 0.005 * LFTri.kr(80, mul: 0.4);
	Out.ar(0, Pan2.ar(sig2+no));
}).add;
)


a = Synth(\ddd, [\dur, 2.0]);



// call synth!
Synth(\gobeat);
Synth(\gobeat, [freq: 660, dur: 2.0, amp:0.1]);
Synth(\gobeat, [freq: 69.midicps, dur: 2.0]);



//change tempo
TempoClock.default.tempo_(50/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.


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
var amp_a = 0.1;
var amp_b = 0.1;
var amp_c = 0.3;

Pdef(\seq1,
	Pbind(
		\instrument, \gobeat,
        \freq, Pseq([52, 52, 52, 71], inf).midicps,
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		\dur, Pseq([0.1, 0.1, 0.1], inf),
		\dur, 1.2,
		\delta, 0.5,
		\amp, amp_a

	)
).quant_(4).play;


Pdef(\seq2,
	Pbind(
		\instrument, \gobeat,
        //\freq, Pseq([69, 69, 69]-5, inf).midicps,
		\freq, Pseq([69, 69, 69]-5, inf).midicps,
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		\dur, Pseq([1.0, 0.25, 0.75], inf),
		// \dur, 1.2,
		\delta, Pseq([0.75, 0.25, 1], inf),
		\amp, amp_b
	)
).quant_(4).play;


Pdef(\seq3,
	Pbind(
		\instrument, \gobeat,
        //\freq, Pseq([69, 69, 69]-5, inf).midicps,
//		\freq, Pseq([61, 59, 61, 63, 64, 63, 61, 56, 59, 56], inf).midicps,
		\freq, Pseq([
			Pseq([61, 59, 61, 63, 64, 63, 61, 56, 59, 56], 1).midicps,
			Pseq([61, 59, 61, 63, 64, 63, 64, 66, 68, 64], 1).midicps,
			Pseq([61, 59, 61, 63, 64, 63, 61, 56, 59, 56], 1).midicps,
			Pseq([61, 59, 61, 63, 64, 63, 64, 66, 68, 68], 1).midicps
		], inf),
		// \atk, Pseq([0.1, 0.2, 0.5], inf),
		\dur, Pseq([0.25], inf),
		// \dur, 1.2,
		\delta, Pseq([0.75, 0.25, 0.5, 0.5, 0.75, 0.25, 0.5, 0.5, 0.75, 3.25], inf),
		\amp, amp_c
	)
).quant_(4).play;
)

(
Pdef(\seq2,
	Pbind(
		\instrument, \ddd,
        \freq, Pseq([240, 300, 290], inf),
		\dur, Pseq([0.1, 0.2, 0.5, 0.2, 1.4, 0.1], inf),
		\delta, Pseq([0.5], inf)
	)
).quant_(4).play;
)
