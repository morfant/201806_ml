
//TODO
- 모던에서 일정한 박자 소리가 좀 더 잘 들리게. (?)
- 여자의 정원 편집본으로 대체
- A/B 음악

- 코카콜라?
- 으르렁대 음원 편집: 중간엔 비트만 나온다든지 하는 변형이 필요하다
- 펩시맨을 대신할 음악
- 개념 무용 음악
- 커튼콜 음악
- eq 처리


//change tempo
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.


// ======================================= Sequence ===========================================


// 인트로 사운드 : 무용수 세 명 나와서 자리 잡으면 go
~syn_buf_intro = Synth.new(\play_buffer, [\bufnum, ~buf_intro, \amp, 1.0]);
~syn_buf_intro.set(\amp, 1.0);
~syn_buf_intro.release(0.3);


// mic on/off
~mic = Synth(\micin, [\amp, 1.0]);
~mic.free;



(// 고대 시작 - Pdef set 하는 방법을 알아 볼것 : 많은 것들을 포함했다. 듣고 go
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~amp_anc_a = 0.1/2;
~amp_anc_b = 0.2/2;
~amp_anc_c = 0.2/2;
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
	).quant_(0).play;
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
	).quant_(0).play;
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
	).quant_(0).play;
// ).quant_(0);

)


(// 혜림씨 돌아서서 모내기 6개 뽑으면 전환
~p1.stop;
~p2.stop;
~p3.stop;

// 중세 비트 속도
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
// 2. 중세 오르간
~fadeOutTime_med = 3.0;
~amp_med_a = 0.1/2;
~amp_med_b = 0.8/2;
~amp_med_c = 0.2/2;
~amp_med_d = 1.0/2;

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
		\amp, ~amp_med_a
	)
// ).quant_(6);
).quant_(0).play;
~m1.fadeTime = ~fadeOutTime_med;

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
		\amp, Pseq([
			Pseq([0.22, 0.2, 0.24, 0.3, 0.24, 0.17, 0.22, 0.3]*~amp_med_b*4/5, 1), // high
			Pseq([0.22, 0.2, 0.24, 0.3, 0.24, 0.17, 0.22, 0.3]*~amp_med_b, 1), // low
		], inf)
	)
// ).quant_(6);
).quant_(0).play;
~m2.fadeTime = ~fadeOutTime_med;


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
		\amp, Pseq([0.9, 0.8, 0.8, 0.9, 0.9]*~amp_med_c, inf),
	)
// ).quant_(6);
).quant_(0).play;
~m3.fadeTime = ~fadeOutTime_med;

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
		\amp, Pseq([0.2]*~amp_med_d, inf),
	)
// ).quant_(6);
).quant_(0).play;
~m4.fadeTime = ~fadeOutTime_med;


// fadeout time
// ~m1.fadeTime = ~m2.fadeTime = ~m3.fadeTime = ~m4.fadeTime = ~fadeOutTime_med;

)


// 중세 오르간 음악은 태이씨 망원경 들고 의자 올라오면 페이드로 나간다.
// fadeout : fadetime은 'ML_patterns' 에서 set
(
~m1 = Pdef(\seq_med_1, Pbind(\amp, 0)).play;
~m2 = Pdef(\seq_med_2, Pbind(\amp, 0)).play;
~m3 = Pdef(\seq_med_3, Pbind(\amp, 0)).play;
~m4 = Pdef(\seq_med_4, Pbind(\amp, 0)).play;
)

// stop
(~m1.stop;~m2.stop;~m3.stop;~m4.stop;)


// 모자르트 음악. : "~정당성을 부여하였다." 끝나면 go
~syn_buf_mozart = Synth.new(\play_buffer, [\bufnum, ~buf_mozart, \amp, 0.9]);
~syn_buf_mozart.set(\amp, 0.9);
~syn_buf_mozart.release(0.3);


// "사리야" : "사리야 예술가의 속성 알려줘." 끝나면 0.5초 쉬고 go
~syn_buf_sari = Synth.new(\play_buffer, [\bufnum, ~buf_sari, \amp, 0.4]);
~syn_buf_sari.set(\amp, 0.2);
~syn_buf_sari.release(0.3);


// 베토벤 음악 : 사리야 끝나고 모두 퇴장했다가 다시 들어와서 '쉿' 소리 세번 듣고 go : 1분후에 끝
~syn_buf_beethoven = Synth.new(\play_buffer, [\bufnum, ~buf_beethoven, \amp, 1.0]);
~syn_buf_beethoven.set(\amp, 1.0);
~syn_buf_beethoven.release(5.0);


// "모던이라고 불렀다" - 민씨가 앞으로 나올때 뭔가 얹어지는 것. - 독창성, 엘리트, 코카콜라처럼 올라오는 소리?
(
// 3. 모던(찰칵찰칵, 컨베이어, 코카콜라, 좀더 팝댄스?)
//change tempo
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~fadeOutTime_mod = 6.0;
~amp_mod_a = 1.2;
~freqAdd = -12;
~freqAdd2 = -2;
~freqAdd3 = -7;
// ~freqAdd = 0;
~freq4 = 112;

// low chord
~c1 = Pdef(\seq_mod_1,
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
		\amp, ~amp_mod_a*4/5

	)
// ).quant_(4).play;
).quant_(0).play;
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



(

~keyaaa = 6;
// base rytm
~c4 = Pdef(\seq_mod_4,
	Pbind(
		// \instrument, \sori,
		\instrument, \gobeat,
		\dur, Pseq([
			Pseq([1, 1/2, 1*3/2, 1, 1], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~keyaaa).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1/32, 1, 1, 1, 1]/3, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		\amp, Pseq([0.2, 0.4, 0.4, 0.4, 0.32], inf),
		// \amp, 0.5

	)
// ).quant_(4).play;
	).quant_(0).play;
// ~c3.fadeTime = ~fadeOutTime_mod;


)

// modern stop : 5분간 인터미션이 있겠습니다 후 조명 나가고 나서 페이드 아웃
// fadeout : fadetime은 'ML_patterns' 에서 set
(
~c1 = Pdef(\seq_mod_1, Pbind(\amp, 0)).play;
~c2 = Pdef(\seq_mod_2, Pbind(\amp, 0)).play;
~c3 = Pdef(\seq_mod_3, Pbind(\amp, 0)).play;
)

//stop
(~c1.stop;~c2.stop;~c3.stop;)



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


// 홈쇼핑 : 암전에서 시작 먼저
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \amp, 0.6]);
~mic = Synth(\micin, [\amp, 1.0]);
~syn_buf_shopping.set(\amp, 0.1); // 소리 줄어듬
~syn_buf_shopping.set(\amp, 0.6); // 소리 커짐
~syn_buf_shopping.release(6.0);
~mic.free;

// 한대수 : 민하씨가 태이씨한테 벽돌을 뺏어서 바닥에 찍을 때, 중간에 민씨 멘트할 때, 작아졌다 커진다. 두 사람 함께 나갈때 페이드 아웃
~syn_buf_handaesoo = Synth.new(\play_buffer, [\bufnum, ~buf_handaesoo, \amp, 0.6]);
~syn_buf_handaesoo.set(\amp, 0.2);
~syn_buf_handaesoo.set(\amp, 0.6);
~syn_buf_handaesoo.release(6.0);

// 여자의 정원 : 세 분 모여서 민씨 뒷모습 보이고 살랑살랑 3번 하고 나면 go
~syn_buf_cello = Synth.new(\play_buffer, [\bufnum, ~buf_cello, \amp, 0.8]);
~syn_buf_cello.set(\amp, 0.8);
~syn_buf_cello.set(\amp, 0.2);
~syn_buf_cello.release(8.0);

// 태이씨 동작에 맞춰야 함 : 2 * 8 듣고 go - 중간엔 비트만 나온다든지 하는 변형이 필요하다
~syn_buf_bts = Synth.new(\play_buffer, [\bufnum, ~buf_bts, \amp, 0.5]);
~syn_buf_bts.set(\amp, 0.1);
~syn_buf_bts.set(\amp, 0.3);


// 으르렁에서 홈쇼핑 음악으로 오버랩
(
// 아래 세 줄 순차 실행
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \amp, 0.0]);
~syn_buf_bts.release(3.0);
~syn_buf_shopping.set(\amp, 0.6); // <<

~syn_buf_shopping.set(\amp, 0.1); // >>
~syn_buf_shopping.release(4.0);
)



// 그다음 '트위스트' : 음악 없음


// 홈쇼핑 중간부터 : "완판" 됐습니다!
// 음악 중간 부터 다시 나온다. - 아래 두 줄 순차 실행
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \start, s.sampleRate * 20, \amp, 0.0]);
~syn_buf_shopping.set(\amp, 0.5);

~mic = Synth(\micin, [\amp, 1.0]);
~syn_buf_shopping.set(\amp, 0.1);
~syn_buf_shopping.release(4.0);
~mic.free;





// 세숫대야 정아씨 솔로 : 음악 없음

// 게임 씬 - 둘 중 하나는 솔로에 쓰이는 음악이다. - 3분 듣고 신호가 있어야 한다.



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
        \amp,               0.2

    ).play;
)


// 찰칵찰칵? - 개념 무용?
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


( // 통통통통 - 폴리 리듬? : a - 3분
{
	var p, a, b;
	p = Impulse.ar(8);
	a = SinOsc.ar(1200, 0, Decay2.ar(p, 0.005, 0.1));
	b = SinOsc.ar(#[224, 100],  0, Decay2.ar(PulseDivider.ar(p, MouseX.kr(1,8).round(1)), 0.005, 0.5));
	[b, a] * 0.4
}.play;
)


p = Pbind(\instrument, \latooncarfian);
p.play;
(// 으르렁대? : : b - 3분
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
    \amp, 0.9
).asStream;
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


// 질문 후에 반복 음악 : 점점 반복 주기 짧아지2

	a = Synth("help-TCoin", [\freq, 210, \freq_am, 9, \amp, 0.3]);
	a.set(\freq, 300, \freq_am, 21, \amp, 0.3);
	a.set(\freq, 400, \freq_am, 9, \amp, 0.3);
	a.set(\freq, 9, \freq_am, 9, \amp, 0.3);
	a.set(\freq, 13, \freq_am, 9, \amp, 0.3);


	a.set(\freq, 10, \freq_am, 9, \amp, 0.0);

	a = Synth("help-TCoin", [\freq, 6, \freq_am, 9, \amp, 0.3]);
	a = Synth("help-TCoin", [\freq, 10, \freq_am, 9, \amp, 0.3]);
	a = Synth("help-TCoin", [\freq, 10, \freq_am, 9, \amp, 0.3]);
a.free;


p.free;

p.stop
p.stream = Pbind(\instrument, \latooncarfian, \amp, 0.0).asStream;