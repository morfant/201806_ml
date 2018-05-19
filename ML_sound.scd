2막 꼬이는 부분 음악 없다

//change tempo
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.


// ======================================= SynthDef ===========================================

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

//new lead - freq를 set 으로 변화 할 때 특별한 효과가 생긴다.
SynthDef(\liedR,
    {
        |freq = 2598, amp = 0.3, gate = 1, efxfreq = 700, panfreq = 3, dronerq = 0.4|
        var sig, env, efx, pansig, out, delay, drone;
        sig = Saw.ar(freq, mul: amp);
        env = EnvGen.kr(Env.adsr(0.1, 0.2, 0.5, 2, 1), gate, doneAction: 2);
        efx = RLPF.ar(sig*env, efxfreq, 0.2, 1);
        drone = RLPF.ar(BrownNoise.ar(0.01), 120, dronerq, 1);
        delay = CombC.ar(efx+drone, 0.2, 0.1, 0.03, 1, efx);
        //env = EnvGen.kr(Env.asr(0.1, 0.2, 0.5), gate, doneAction: 2);
        pansig = LFTri.kr(panfreq, mul: 0.5, add: 0);
        out = Out.ar(0, Pan2.ar(delay, pansig));
    }).add;

SynthDef("latooncarfian", { arg out = 0, freq = 440, chFreq1 = 2, chFreq2 = 2,
	a = 1, b = 3, c = 0.5, d = 0.5, gate = 1, amp = 0.3;
    var s1, s2, env;
        s1 = LatoocarfianN.ar(
    SampleRate.ir/4,
    LFNoise2.kr(chFreq1,1.5,1.5),
    LFNoise2.kr(chFreq1,1.5,1.5),
    LFNoise2.kr(chFreq1,0.5,1.5),
    LFNoise2.kr(chFreq1,0.5,1.5), mul: 0.1
);

        s2 = LatoocarfianN.ar(
    SampleRate.ir/4,
    LFNoise2.kr(chFreq2,1.5,1.5),
    LFNoise2.kr(chFreq2,1.5,1.5),
    LFNoise2.kr(chFreq2,0.5,1.5),
    LFNoise2.kr(chFreq2,0.5,1.5), mul: 0.1
);

Out.ar(out, [s1, s2] * amp);

}).add;


SynthDef(
    \hafen,
    {
        arg freqScale = 200, amp = 0.1, gate = 1, inNum = 0;
        var sig, env, envgen, inputs, n = 32;
        inputs = [PinkNoise.ar(0.3), WhiteNoise.ar(0.1), ClipNoise.ar(0.1), BrownNoise.ar(0.2)];
        sig = DynKlank.ar(`[ (1..13)*freqScale, 1/(1..13), nil ],
            Select.ar(inNum, inputs));
        env = Env(
		[0]++{0.8.rand.squared}.dup(n-1) ++ [0],
				{rrand(0.1,0.3)}.dup(n),
				\lin, n-8, 8 );
        envgen = EnvGen.kr(env, gate, doneAction: 2);
        Out.ar(0, Pan2.ar(sig * envgen, 0, amp));
    }
).add;


SynthDef("lfp", { arg out = 100, freq = 440, chFreq1 = 2, chFreq2 = 2,
	a = 1, b = 3, c = 0.5, d = 0.5,
	aa = 1, bb = 3, cc = 0.5, dd = 0.5,
	gate = 1, amp = 0.1;
    var s1, s2, env;
    env = EnvGen.kr(Env.perc(0.15, 0.05), gate, doneAction: 2);
    s1 = LatoocarfianN.ar(SampleRate.ir/4, a, b, c, d, mul: 0.1);
    s2 = LatoocarfianN.ar(SampleRate.ir/4, aa, bb, cc, dd, mul: 0.1);

Out.ar(out, [s1, s2]*env*amp);

}).add;


// Synthdef 4 - Reverb
SynthDef(\verb,
    {
        arg in = 0, room = 2, rtime = 1, dam = 0.3, sp = 5, tail = 0.2;
        var sig, fil;
        sig = In.ar(in, 1);
        fil = GVerb.ar(sig, room = 2, rtime, dam, 0.5, sp, taillevel: tail);
        Out.ar(0, fil);

}).add;


// Synthdef 5
SynthDef(\woong,
    {
        arg cutoff = 202, rq = 1.0, sn = 8, amp = 0.5, gate = 1, freq = 55, freq2 = 75, freq3 = 100;
        var sig, fil, lfo, env;

		env = EnvGen.kr(Env.perc, gate, doneAction: 2);
        lfo = LFClipNoise.kr(sn, mul: 0.5, add: 0.5);
		sig = Mix.new([Saw.ar(freq, mul: amp/2), Saw.ar(freq3, mul: amp/2), Saw.ar(freq2, mul: amp/2)]) * lfo;
        fil = RLPF.ar(sig, cutoff, rq);
		Out.ar(0, Pan2.ar(fil*amp*env, 0));
    }
).add;


// {Mix.new([Saw.ar(100, mul: 0.4), Saw.ar(200, mul: 0.4)])!2}.play;

// Synthdef 6
SynthDef(\woonglong,
    {
        arg cutoff = 202, rq = 1.0, sn = 8, gate = 1, amp = 0.6;
        var sig, fil, lfo, env;

        env = EnvGen.kr(Env.asr(1.3, 1, 3), gate, doneAction: 2);
        sig = Saw.ar([50, 75], 1);
        fil = RLPF.ar(sig, cutoff, rq);
        Out.ar(0, fil * env * amp);
    }
).add;


// Synthdef 7
SynthDef(\dirac, {| out, amp = 0.03, freq = 100, decay = 0.01, pos = -1 |
		var i = Impulse.ar(0), sig;
//		sig = Mix.fill(6, {Ringz.ar(i, Rand(freq, freq*[1.5, 2]), decay)});
		sig = Mix.fill(6, {Ringz.ar(i, Rand(freq, freq*1.5), decay)});
		DetectSilence.ar(sig, doneAction: 2);
		sig = Pan2.ar(sig, pos, amp);
		Out.ar(out, sig);
	}).add;


// Synthdef 8
SynthDef("help-TCoin", { arg out=0, prob=0.5;
	var trig;
	trig = Impulse.ar(20, 0, SinOsc.kr(0.5,0,1,1));
	Out.ar(out,
		Mix.fill(3, {Ringz.ar(CoinGate.ar(prob, trig*0.5), #[1,1.5]*Rand(5000, 9000), 0.01)})*0.2
	)
}).add;


SynthDef(\sori,
	{
		arg amp = 1, freq = 20, freq2 = 20, gate = 1, ph = 0,
		freq3 = 10, filfreq = 100, rq = 0.2, freq4 = 100, dop = 0.5, harm = 200 ;
		var sig, env, sig2, env2, sig3, sig4, fil;
		//		env2 = EnvGen.kr(Env.perc(0.1, 0.5), gate, doneAction: 2);
		env2 = EnvGen.kr(Env.asr, gate, doneAction: 2);
		//		sig2 = SinOsc.kr(freq2*env2, ph);
		//		sig2 = LFTri.kr(freq2*env2, ph);
		//		sig2 = WhiteNoise.kr(1);
		sig4 = Blip.kr(freq4, harm);
		sig3 = SinOsc.kr(freq3);
		sig2 = LFNoise0.kr(freq2);

		sig = SinOsc.ar(freq*sig4, mul: 1);
		env = EnvGen.kr(Env.asr, gate, doneAction: 2);
		fil = RHPF.ar(sig, freq, rq);
		Out.ar(0, Pan2.ar(fil*env*amp));
	}
).add;
)



//change tempo
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.


// ======================================= Sequence ===========================================

(// 1. 고대 비트
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


정아씨 판서 점 찍을 때 중세 음악과 오버랩,

(
~p1.stop;
~p2.stop;
~p3.stop;
~m1.play;
~m2.play;
~m3.play;
~m4.play;
)



~m1.play;
~m3.play;
~m3.stop;
~m3.play;


~m3.stop;
~m4.stop;
~m3.play;

(// 2. 중세 오르간
~fadeOutTime = 6.0;

// rytm
~m1 = Pdef(\seq_med_1,
	Pbind(
		\instrument, \liedR,
		\freq, Pseq([
			// Pseq(([49, 54, 53]).midicps, 4),
			Pseq(([51, 56, 55]).midicps, 4),
			Pseq(([49, 54, 53]).midicps, 4),
		], inf),
		\dur, Pseq([0.1, 0.2, 0.5, 0.2, 1.4, 0.1], inf),
		\delta, Pseq([0.5], inf),
		\amp, 0.1
	)
).quant_(6);
~m1.fadeTime = ~fadeOutTime;

// melody
~m2 = Pdef(\seq_med_2,
	Pbind(
		\instrument, \liedR,
		\freq, Pseq([
			Pseq(([0, 67, 69, 71, 62, 66, 67, 69]+8).midicps, 1),
			// Pseq(([55, #[67, 59], #[69, 59], #[71, 55], #[62, 53], 66, #[67, 55], #[69, 53]]+8).midicps, 1),
			Pseq(([55, #[59], #[59], #[55], #[53], 55, #[55], #[53]]+8).midicps, 1),
		], inf),

		\atk, 0.7,
		// \dur, Pseq([Rest(2.5), 0.5, 1.5, 1.5, 2.5, 0.5, 1.5, 1.5], inf),
		\dur, Pseq([(2.5), 0.5, 1.5, 1.5, 2.5, 0.5, 1.5, 1.5], inf),
		// \delta, Pseq([Rest(2.5), 0.5, 1.5, 1.5, 2.5, 0.5, 1.5, 1.5], inf),
		\delta, Pseq([(2.5), 0.5, 1.5, 1.5, 2.5, 0.5, 1.5, 1.5], inf),
		\amp, Pseq([0.22, 0.2, 0.24, 0.3, 0.24, 0.17, 0.22, 0.3]*0.8, inf),
	)
).quant_(6);
~m2.fadeTime = ~fadeOutTime;

// 빰빠라밤
~m3 = Pdef(\seq_med_3,
	Pbind(
		\instrument, \liedR,
		\freq, Pseq([
			// Pseq(([66, 73, 73, 73, 73]-10).midicps, 1),
			Pseq(([66, 73, 73, 73, 73]-8).midicps, 1),
			Pseq(([66, 73, 73, 73, 73]-10).midicps, 1),
			// Pseq(([[66, 64], 73, 73, 73, 73]-12).midicps, 1),
			// Pseq(([[66, 62], 73, 73, 73, 73]-12).midicps, 1),
			// Pseq(([[66, 64], 73, 73, 73, 73]-12).midicps, 1)
		], inf),

		\atk, 0.1,
		\dur, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 3], inf), // 박이 끝나는 부분이 일치
		\delta, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 3], inf), // 박이 끝나는 부분이 일치
		// \delta, Pseq([2.5, 0.25, 0.25/2, 0.25/2, 1.5], inf), // 박이 끝나는 부분이 불일치, 페이즈 음악, 돌림노래 같은 느낌
		\amp, Pseq([0.9, 0.8, 0.8, 0.9, 0.9]*0.2, inf),
	)
).quant_(6);
~m3.fadeTime = ~fadeOutTime;

//bass
~m4 = Pdef(\seq_med_4,
	Pbind(
		\instrument, \liedR,
		\freq, Pseq([
			// Pseq(([41]-16).midicps, 4),
			Pseq(([43]-16).midicps, 4),
			Pseq(([41]-16).midicps, 4),
			Pseq(([43]-16).midicps, 4),
			Pseq(([41, 41, 41, 41, 39, 41]-16).midicps, 1),
		], inf),

		\atk, 0.1,
		\dur, Pseq([0.3], inf),
		\delta, Pseq([
			Pseq([1.5], 15),
			Pseq([0.5], 3)
		], inf),
		\amp, Pseq([0.2], inf),
	)
).quant_(6);
~m4.fadeTime = ~fadeOutTime;

);

~m4.play;

(// play all
~m1.play;~m2.play;~m3.play;~m4.play;
)

Cue: 중세 오르간 음악은 태이씨 의자 올라와서 망원경 다 펴고 탑 조명이 들어오면 페이드로 나간다. ("장인의 운명")
(// fadeout
~m1 = Pdef(\seq_med_1, Pbind(\amp, 0)).play;
~m2 = Pdef(\seq_med_2, Pbind(\amp, 0)).play;
~m3 = Pdef(\seq_med_3, Pbind(\amp, 0)).play;
~m4 = Pdef(\seq_med_4, Pbind(\amp, 0)).play;
)

(// stop
~m1.stop;~m2.stop;~m3.stop;~m4.stop;
)




그 다음은 모자르트 음악.

"사리야"

베토벤 음악

찰칵찰칵 음악


(// 3. 모던(찰칵찰칵, 컨베이어, 코카콜라, 좀더 팝댄스?)

~amp_mor_a = 0.7;
~freqAdd = -12;
~freqAdd2 = -2;
~freqAdd3 = -7;
// ~freqAdd = 0;
~freq4 = 112;

// low chord
~c1 = Pdef(\seq_mor_1,
	Pbind(
		\instrument, \woong,
		\dur, Pseq([
			Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd).midicps, 1),
			Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\freq2, Pseq([
			Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd2).midicps, 1),
			Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd2).midicps, 1),
		], inf),
		\freq3, Pseq([
			Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd3).midicps, 1),
			Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd3).midicps, 1),
		], inf),
		\freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		// \sn, Pseq((80..8), 1),
		\sn, 8,
		\amp, ~amp_mor_a

	)
).quant_(0).play;


// high chord
~c2 = Pdef(\seq_mor_2,
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
		\amp, ~amp_mor_a

	)
).quant_(0).play;

// base rytm
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
		\amp, ~amp_mor_a/12

	)
).quant_(0).play;

)

// 112.midicps
// 115.midicps
// 110.midicps
// 120.midicps
// 5.midicps
// 160.midicps%s.sampleRate
// 80.midicps%s.sampleRate

(// sf 느낌
~amp_mor_a = 0.3;
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
		\amp, ~amp_mor_a/2

	)
).quant_(0).play;


)

(
a = Synth(\sori);
a.set(\freq, 200, \freq2, 20, \freq3, 10, \amp, 0.1, \freq4, 100);
)


//lead
(
c = Pbind(
        \instrument,        \sori,
//        \nharms,            32,
	// \root,             [-3, 12],
	\dur,           Pseq([5, 5, 5, 4, 4, 3, 7, 3, 2, 4, 6, 2]/5, 12),
	\freq,           Pseq([50, 100, 200, 300, 100, 300, 200], 12),
	\freq4,          Pseq([4, 6, 9, 2, 3, 4, 6, 2, 8, 2, 1, 30], 12),
        \amp,               0.02

    ).play;
)


// 찰칵찰칵?
//ambient
(
c = Pbind(
        \instrument,        \sori,
        \dur,               Pseq([4, 2, 1, 5, 1, 2, 0.4, 0.2, 0.5]/3, 9),
        \degree,            Pseq( [1, 2, 7, 2, 22, 39, 44]/148, 9),
        \amp,               0.1

    ).play;
// )


( // 통통통통
{
	var p, a, b;
	p = Impulse.ar(8);
	a = SinOsc.ar(1200, 0, Decay2.ar(p, 0.005, 0.1));
	b = SinOsc.ar(#[224, 100],  0, Decay2.ar(PulseDivider.ar(p, MouseX.kr(1,8).round(1)), 0.005, 0.5));

	[b, a] * 0.4
}.play;
)


( // 타다다닥
t = { arg gate=1, prob = 0.4;
	var env, n=32, sig, trig;
	trig = Impulse.ar(150, 0, SinOsc.kr(0.5,0,0.5,0.5));

	sig = Mix.fill(3, {Ringz.ar(CoinGate.ar(prob, trig*0.5), #[0.1, 1, 3]*Rand(5000, 6000), 0.1)})*0.2;
	env = Env(
		[0]++{1.0.rand.squared}.dup(n-1)++[0],
				{rrand(0.005,0.3)}.dup(n),
				\lin, n-8, 8 );
	EnvGen.kr(env, gate, doneAction: 2) * sig
}.play;
)

t.free;
#[1,1.5]

['a']++['b']
		[0]++{1.0.rand.squared}.dup(3-1)++[0]


Ringz.ar(

p = Pbind(\instrument, \latooncarfian);

p.play;

(// 으르렁대?
p.stream = Pbind(
	\instrument, \latooncarfian,
    \dur, 1,
	\a, Prand((0.1, 0.2..3.0), inf),
	\b, Prand((0.1, 0.2..3.0), inf),
	\c, Prand((0.1, 0.2..3.0), inf),
	\d, Prand((0.1, 0.2..3.0), inf),
	\aa, Pbeta(0.1, 3.0, 0.2, 0.2, inf),
	\bb, Pbeta(0.1, 3.0, 0.2, 0.2, inf),
	\cc, Pbeta(0.1, 3.0, 0.2, 0.2, inf),
	\dd, Pbeta(0.1, 3.0, 0.2, 0.2, inf),
    \amp, 0.1
).asStream;
)

p.free;

p.stop
p.stream = Pbind(\instrument, \latooncarfian, \amp, 0.0).asStream;