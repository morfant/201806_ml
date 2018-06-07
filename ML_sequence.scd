
//TODO
- 모던에서 일정한 박자 소리가 좀 더 잘 들리게. (?)
- 여자의 정원 편집본으로 대체
- A/B 음악
- 커튼콜 음악
- 코카콜라?
- 으르렁대 음원 편집: 중간엔 비트만 나온다든지 하는 변형이 필요하다
- 펩시맨을 대신할 음악
- 개념 무용 음악
- 베토벤 2분짜리로 만들어 놓을 것
- 하우스 음악 : 정적만 아니게 들릴 듯 말 듯?
- 전체 음량 맞추기
- 커튼콜 음악 등 디테일 수정

- eq 처리
- 큐, 마이크 온 오프 정



//change tempo
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.


// ======================================= Sequence ===========================================


// 인트로 사운드 : 무용수 세 명 나와서 자리 잡으면 go
~syn_buf_intro = Synth.new(\play_buffer, [\bufnum, ~buf_intro, \amp, 0.8]);
~syn_buf_intro.set(\amp, 0.8);
~syn_buf_intro.release(0.3);


// mic on/off test
~mic = Synth(\micin, [\amp, 0.6]);
~mic.set(\amp, 0.6);
~mic.free;



(// 고대 시작

// 인트로에서 민하씨가 "~에서 ~를 빼면" 하면 하고 조명 암전 되면 go
// 혜림씨 탑 조명 들어오고 모내기 3번 하고 나면 '농협' 인터뷰 go
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

// 혜림씨 농협 인터뷰 - 혜림씨가 모내기 세번 하면 go
~syn_buf_voice_haerim = Synth.new(\play_buffer, [\bufnum, ~buf_voice_haerim, \amp, 0.6]);
~syn_buf_voice_haerim.set(\amp, 0.6);
~syn_buf_voice_haerim.release(0.3);


// 무용수들 멘트


// 정아씨 멘트: "섞여 있었다."로 끝
~mic = Synth(\micin, [\amp, 1.0]);
~mic.set(\amp, 1.0);
~mic.free;


(// 중세
// 무용수들 모두 고대 옷 벗고 월계관 벗어 놓고 민, 태이씨 뒤로 두 걸음 걸어 나와서 서면 전환 (빠른 것 보다는 조금 늦는게 낫다)
// 어떤 경우 박자가 맞지 않는다!!!!!!
~p1.stop;
~p2.stop;
~p3.stop;

// 중세 비트 속도
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
// 2. 중세 오르간
~fadeOutTime_med = 3.0;
~amp = 0.7;
~amp_med_a = ~amp*0.1/2;
~amp_med_b = ~amp*0.8/2;
~amp_med_c = ~amp*0.2/2;
~amp_med_d = ~amp*1.0/2;

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
).quant_(0);
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
).quant_(0);
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
).quant_(0);
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
).quant_(0);
~m4.fadeTime = ~fadeOutTime_med;


// fadeout time
// ~m1.fadeTime = ~m2.fadeTime = ~m3.fadeTime = ~m4.fadeTime = ~fadeOutTime_med;

~m1.play;~m2.play;~m3.play;~m4.play;
)

// 무용수들 무대를 가로질러 조각처럼 선다.
// 멘트: 점진적인 변화가 시작된다
// 태이씨 의자를 가지고 하수 탑에 선다.
// 멘트: 과학의 승리로 일반화 된다.

// 정아씨 멘트 x 2 : 점진적인 변화가 시작된다. / 과학의 승리로 일반화 되었다.
~mic = Synth(\micin, [\amp, 1.0]);
~mic.set(\amp, 0.8);
~mic.free;


// 중세 오르간 음악은 태이씨 이외의 무용수들이 모두 나가고, 태이씨 망원경 들고 의자 올라와서 펴기 시작하면 탑 조명 들어오면 페이드로 나간다.
// 이때 태이씨 나레이션 go
(
~m1 = Pdef(\seq_med_1, Pbind(\amp, 0)).play;
~m2 = Pdef(\seq_med_2, Pbind(\amp, 0)).play;
~m3 = Pdef(\seq_med_3, Pbind(\amp, 0)).play;
~m4 = Pdef(\seq_med_4, Pbind(\amp, 0)).play;
~syn_buf_voice_taei = Synth.new(\play_buffer, [\bufnum, ~buf_voice_taei, \amp, 0.6]);
)


// 태이씨 나레이션 끝나면 중세 음악이 살짝 다시 들어온다. (fade in 처리!!)
(
~m1.stop;~m2.stop;~m3.stop;~m4.stop;
~mic = Synth(\micin, [\amp, 1.0]);
// 어떤 경우 박자가 맞지 않는다!!!!!!
~p1.stop;
~p2.stop;
~p3.stop;

// 중세 비트 속도
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
// 2. 중세 오르간
~fadeOutTime_med = 3.0;
~amp = 0.1;
~amp_med_a = ~amp*0.1/2;
~amp_med_b = ~amp*0.8/2;
~amp_med_c = ~amp*0.2/2;
~amp_med_d = ~amp*1.0/2;

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
).quant_(0);
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
).quant_(0);
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
).quant_(0);
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
).quant_(0);
~m4.fadeTime = ~fadeOutTime_med;


// fadeout time
// ~m1.fadeTime = ~m2.fadeTime = ~m3.fadeTime = ~m4.fadeTime = ~fadeOutTime_med;

~m1.play;~m2.play;~m3.play;~m4.play;
)

// '장인의 운명' 멘트


// 정아씨가 '장인의 운명' 하고, 최여사님 탑 조명 들어오면 최여사님 나레이션 나온다.
~syn_buf_voice_mom = Synth.new(\play_buffer, [\bufnum, ~buf_voice_mom, \amp, 0.6]);
~syn_buf_voice_mom.set(\amp, 0.6);
~syn_buf_voice_mom.release(0.3);



// 최여사님 무대 밖으로 나갈때 음악 같이 아웃. 아웃 하면서 정아씨 다음 멘트로 이어짐
(
~m1 = Pdef(\seq_med_1, Pbind(\amp, 0)).play;
~m2 = Pdef(\seq_med_2, Pbind(\amp, 0)).play;
~m3 = Pdef(\seq_med_3, Pbind(\amp, 0)).play;
~m4 = Pdef(\seq_med_4, Pbind(\amp, 0)).play;
)



// stop
(~m1.stop;~m2.stop;~m3.stop;~m4.stop;)


// 정아씨 멘트
~mic = Synth(\micin, [\amp, 1.0]);
~mic.set(\amp, 0.8);
~mic.free;



// 모자르트 음악. : "~정당성을 부여했다." 끝나면, 무대위 무용수들이 천을 완전히 잡으면(?). go
~syn_buf_mozart = Synth.new(\play_buffer, [\bufnum, ~buf_mozart, \amp, 0.55]);
~syn_buf_mozart.set(\amp, 0.9);
~syn_buf_mozart.release(0.3);


// 정아씨 멘트 (천 바닥에 떨어지고 나면)
~mic = Synth(\micin, [\amp, 1.0]);
~mic.set(\amp, 0.8);
~mic.free;


// "사리야" : "사리야 예술가의 속성 알려줘." 끝나면 0.5초 쉬고 go
~syn_buf_sari = Synth.new(\play_buffer, [\bufnum, ~buf_sari, \amp, 0.45]);
~syn_buf_sari.set(\amp, 0.2);
~syn_buf_sari.release(0.3);

// cmd . 할 수 있는 포인트

// "쉿" : 정아씨 마이크
~mic = Synth(\micin, [\amp, 1.0]);
~mic.set(\amp, 0.8);
~mic.free;


// 베토벤 음악 : 사리야 끝나고 모두 퇴장했다가 다시 들어와서 (정아-태이-세번째 쉿-네번째 쉿-다선번째 쉿)'쉿' 소리 5번 듣고 go
~syn_buf_beethoven = Synth.new(\play_buffer, [\bufnum, ~buf_beethoven, \amp, 0.6]);
~syn_buf_beethoven.set(\amp, 0.4);
~syn_buf_beethoven.release(5.0);


// 민하씨 사진 찍을때 정아씨 멘트
~mic = Synth(\micin, [\amp, 1.0]);
~mic.set(\amp, 0.8);
~mic.free;


// 3. 모던(찰칵찰칵, 컨베이어, 코카콜라, 좀더 팝댄스?)
// "모던이다"
(
~mic.free;

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
		\amp, ~amp_mod_a*4/7

	)
// ).quant_(4).play;
).quant_(0);
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
).quant_(0);
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
).quant_(0);
~c3.fadeTime = ~fadeOutTime_mod;

~c1.play;~c2.play;~c3.play;
)



(// 민씨 의자 가지고 나올 때 : 천천히! // 피아노 소리 fade in, 조금 작게
// t.free;
~c3.stop;
~keyaaa = -3;
// base rytm
~c4 = Pdef(\seq_mod_4,
	Pbind(
		// \instrument, \sori,
		// \instrument, \gobeat,
		\instrument, "help-TCoin",
		\dur, Pseq([
			Pseq([1, 1/2, 1*3/2, 1, 1], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~keyaaa).midicps, 1),
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~keyaaa-2).midicps, 1),
			Pseq(([65, 68, 59, #[71, 66], #[69, 66]]+~keyaaa+5).midicps, 1),
			// Pseq(([65, 68, 59, #[71, 66], #[69, 66]]+~keyaaa-3).midicps, 1),
		], inf),
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1/32, 1, 1, 1, 1]/1, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		\amp, Pseq([0.2, 0.4, 0.4, 0.4, 0.32]/5, inf),
		// \amp, 0.5

	)
// ).quant_(4).play;
).quant_(0).play;
~c4.fadeTime = ~fadeOutTime_mod;
)


(// 피아노 소리 fade out: 천천히!
~keyaaa = -3;
// base rytm
~c4 = Pdef(\seq_mod_4,
	Pbind(
		// \instrument, \sori,
		// \instrument, \gobeat,
		\instrument, "help-TCoin",
		\dur, Pseq([
			Pseq([1, 1/2, 1*3/2, 1, 1], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~keyaaa).midicps, 1),
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~keyaaa-2).midicps, 1),
			Pseq(([65, 68, 59, #[71, 66], #[69, 66]]+~keyaaa+5).midicps, 1),
			// Pseq(([65, 68, 59, #[71, 66], #[69, 66]]+~keyaaa-3).midicps, 1),
		], inf),
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1/32, 1, 1, 1, 1]/1, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		\amp, Pseq([0.2, 0.4, 0.4, 0.4, 0.32]*0, inf),
		// \amp, 0.5

	)
// ).quant_(4).play;
).quant_(0).play;
~c4.fadeTime = ~fadeOutTime_mod;
)

// 파도소리 인터뷰 추가 : 태이씨가 사다리 가지고 들어와서 자리 잡으면 go
~syn_buf_outtro_wave = Synth.new(\play_buffer, [\bufnum, ~buf_outtro_wave, \amp, 2.0]);
~syn_buf_outtro_wave.set(\amp, 1.7);
~syn_buf_outtro_wave.release(0.3);

// 다시 피아노 fade in
~c4.stop;

// 인터미션 안내에도 마이크?
~mic = Synth(\micin, [\amp, 1.0]); // 피아노 소리 올리고 마이크를 켜면 소리가 다르다? 왜??
~mic.set(\amp, 0.8);
~mic.free;

// modern stop : 5분간 인터미션이 있겠습니다 후 조명 나가고 나서 페이드 아웃
(
~c1 = Pdef(\seq_mod_1, Pbind(\amp, 0)).play;
~c2 = Pdef(\seq_mod_2, Pbind(\amp, 0)).play;
~c3 = Pdef(\seq_mod_3, Pbind(\amp, 0)).play;
~c4 = Pdef(\seq_mod_4, Pbind(\amp, 0)).play;
)


//stop
(~c1.stop;~c2.stop;~c3.stop;~c4.stop;)




--------- 2 막 ----------
// **** 무선 마이크 리시버 켜져 있는지 체크 ****
// mic 테스트
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]); // 테스트는 좀 크게
~mic1.set(\amp, 0.8);
~mic1.free;

// ======== 홈쇼핑 : 암전에서(하우스가 꺼지면) 시작 먼저, 마이크 on ========
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \amp, 0.5]);
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]);
~mic1.set(\amp, 0.9);
~syn_buf_shopping.set(\amp, 0.1); // 소리 줄어듬
~syn_buf_shopping.set(\amp, 0.5); // 소리 커짐
~syn_buf_shopping.release(4.0);
~mic1.free; //  free 안해도 됨


// ======== 한대수 ========
// 멘트: 첫번째 작품 시작하겠습니다.
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]);
~mic1.set(\amp, 0.8);
~mic1.free;

// 중간에 민 씨 멘트 있음
// 한대수 : 민하씨가 태이씨한테 벽돌을 뺏어서 바닥에 찍을 때, 중간에 민씨 멘트할 때, 작아졌다 커진다. 두 사람 함께 나갈때 페이드 아웃
~syn_buf_handaesoo = Synth.new(\play_buffer, [\bufnum, ~buf_handaesoo, \amp, 0.6]);
~syn_buf_handaesoo.set(\amp, 0.2);
~syn_buf_handaesoo.set(\amp, 0.5);
~syn_buf_handaesoo.release(4.0);

//끝나자 마자 멘트
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]);
~mic1.set(\amp, 0.8);
~mic1.free;

// ======== 여자의정원 ========
// 멘트: 민씨 합류 했다가 다시 나오면서 멘트 또 있다.
// 여자의 정원 : 세 분 모여서 민씨 뒷모습 보이고 살랑살랑 3번 하고 나면 go
~mic1.free;
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]);// 중간에 민씨 멘트
~syn_buf_cello = Synth.new(\play_buffer, [\bufnum, ~buf_cello, \amp, 0.8]);~mic1.free;
~syn_buf_cello.set(\amp, 0.8);
~syn_buf_cello.set(\amp, 0.2);
~syn_buf_cello.release(8.0);


// 멘트
~mic1 = Synth(\micin, [\amp, 0.8, \in, 1]);
~mic1.set(\amp, 1.2);
~mic1.free;


// ~mic1.set(\amp, 1.2);
// 여자의 정원 끝나면, 개념무용 음악 먼저 go

(// 개념 무용 : 실행만 - 소리는 안남
var ampMul = 0;


~key_con_add = 0;
~fadeOutTime_con = 4.0;

~con = Pdef(\seq_concept_1,
	Pbind(
		// \instrument, \gobeat,
		\instrument, \condan,
		// \instrument, "help-TCoin",
		\dur, Pseq([
			Pseq([1, 1/2, 1*3/2, 1, 1]/4, 1),
		], inf),
		\freq, Pseq([
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~key_con_add).midicps, 1),
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~key_con_add-2).midicps, 1),
			Pseq(([65, 68, 59, #[71, 66], #[69, 66]]+~key_con_add+5).midicps, 1),
			Pseq(([65, 68, 59, #[71, 66], #[69, 66]]+~key_con_add-3).midicps, 1),
		], inf),
		\delta, Pseq([
			Pseq([1/32, 1, 1, 1, 1]*2/3, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		\amp, Pseq([0.2, 0.4, 0.4, 0.4, 0.32]*ampMul, inf),
		\amp2, 0.1,
		\freq2, 800,

	)
).quant_(0).play;
~con.fadeTime = ~fadeOutTime_con;
)

(// 개념 무용 동작은 무 들고 뛰어 다니기 : fade in

var ampMul = 0.5;

// 민씨 움직이며 멘트
~mic1 = Synth(\micin, [\amp, 0.8]);


~key_con_add = 0;
~fadeOutTime_con = 4.0;

~con = Pdef(\seq_concept_1,
	Pbind(
		// \instrument, \gobeat,
		\instrument, \condan,
		// \instrument, "help-TCoin",
		\dur, Pseq([
			Pseq([1, 1/2, 1*3/2, 1, 1]/4, 1),
		], inf),
		\freq, Pseq([
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~key_con_add).midicps, 1),
			Pseq(([65, 68, 59, #[71, 68], #[69, 66]]+~key_con_add-2).midicps, 1),
			Pseq(([65, 68, 59, #[71, 66], #[69, 66]]+~key_con_add+5).midicps, 1),
			Pseq(([65, 68, 59, #[71, 66], #[69, 66]]+~key_con_add-3).midicps, 1),
		], inf),
		\delta, Pseq([
			Pseq([1/32, 1, 1, 1, 1]*2/3, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
		], inf),
		\amp, Pseq([0.2, 0.4, 0.4, 0.4, 0.32]*ampMul, inf),
		\amp2, 0.1,
		\freq2, 800,

	)
).quant_(0).play;
~con.fadeTime = ~fadeOutTime_con;
)


// 민씨 들고 움직이며 멘트
~mic1 = Synth(\micin, [\amp, 1.2]);
~mic1.set(\amp, 1.2);
~mic1.free;


// 민씨 "네!~" 하면 개념무용 fade out
(// fadeout
~con = Pdef(\seq_concept_1, Pbind(\instrument, \condan, \amp, 0)).play;
)

~con.stop;


// 멘트
~mic1 = Synth(\micin, [\amp, 1.2]);
~mic1.set(\amp, 1.4);
~mic1.free;


// 나 정말 으르렁 대
// 태이씨 동작에 맞춰야 함 : 2 * 8 듣고 go - 중간엔 비트만 나온다든지 하는 변형이 필요하다 - 태이씨 덩실덩실 다음 앞으로 손 내리칠 때 go
// 무용수들 나갈때 으러렁과 다음 홈쇼핑 음악 오버랩
(
a.free;
a = Synth(\play_buffer_m, [\bufnum, ~buf_bts, \amp, 0.4, \out, 100]);
// a = Synth(\play_buffer_m, [\bufnum, ~buf_bts, \amp, 0.2, \out, 0]);
//bts
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~ululung_fil = Pdef(\seq_fff,
	Pbind(
		\instrument, \fil,
		\dur, 1,
		\delta, 1,
		\freq, 20000,
		\ping_amp, 0.30,
		\ping_freq, 700,
		// \fm_freq, Pseq([90, 100, 10, 40]/10, inf),
		\fm_freq, Pseq([2300, 2600, 3000, 4000]*2, inf),
		\fm_amp, 0.8,
		// \addamp, 0.0,
		\addamp, 0.9,

		// \freq, Pseq([20, 100, 100, 10, 20, 30, 60, 120]*60, inf),
		// \freq, Pseq([2000, 100, 3000, 600], inf),
		// \freq, 100,
		// \addamp, Pseq([1, 1.0], inf),
		// \rq, 1,
        \amp, 0.9,
		// \freq_tri, Pseq([10, 2, 1, 20, 100, 1000, 10000], inf),
		// \amp_tri, 1,
		\atktime, 0.1,
		\sustime, 0.9,
		\reltime, 0.1,
		\addAction, 1


	)
).quant_(0).play;
~ululung_fil.fadeTime = 3.0;
)

// 민씨 다시 멘트
~mic1 = Synth(\micin, [\amp, 1.2, \in, 1]);

(// 멘트 나올때 소리 줄이기
~ululung_fil = Pdef(\seq_fff,
	Pbind(
		\instrument, \fil,
		\dur, 1,
		\delta, 1,
		\freq, 20000,
		\ping_amp, 0.30,
		\ping_freq, 700,
		// \fm_freq, Pseq([90, 100, 10, 40]/10, inf),
		\fm_freq, Pseq([2300, 2600, 3000, 4000]*2, inf),
		\fm_amp, 0.8,
		// \addamp, 0.0,
		\addamp, 0.9,

		// \freq, Pseq([20, 100, 100, 10, 20, 30, 60, 120]*60, inf),
		// \freq, Pseq([2000, 100, 3000, 600], inf),
		// \freq, 100,
		// \addamp, Pseq([1, 1.0], inf),
		// \rq, 1,
        \amp, 0.4,
		// \freq_tri, Pseq([10, 2, 1, 20, 100, 1000, 10000], inf),
		// \amp_tri, 1,
		\atktime, 0.1,
		\sustime, 0.9,
		\reltime, 0.1,
		\addAction, 1


	)
).quant_(0).play;
~ululung_fil.fadeTime = 3.0;
)

(// 다시 커지기

~ululung_fil = Pdef(\seq_fff,
	Pbind(
		\instrument, \fil,
		\dur, 1,
		\delta, 1,
		\freq, 20000,
		\ping_amp, 0.30,
		\ping_freq, 700,
		// \fm_freq, Pseq([90, 100, 10, 40]/10, inf),
		\fm_freq, Pseq([2300, 2600, 3000, 4000]*2, inf),
		\fm_amp, 0.8,
		// \addamp, 0.0,
		\addamp, 0.9,

		// \freq, Pseq([20, 100, 100, 10, 20, 30, 60, 120]*60, inf),
		// \freq, Pseq([2000, 100, 3000, 600], inf),
		// \freq, 100,
		// \addamp, Pseq([1, 1.0], inf),
		// \rq, 1,
        \amp, 0.9,
		// \freq_tri, Pseq([10, 2, 1, 20, 100, 1000, 10000], inf),
		// \amp_tri, 1,
		\atktime, 0.1,
		\sustime, 0.9,
		\reltime, 0.1,
		\addAction, 1


	)
).quant_(0).play;
~ululung_fil.fadeTime = 3.0;
)


(// "저는 이작품 놓치지 않을건데요". 으르렁에서 홈쇼핑 음악으로 오버랩
// 아래 세 줄 순차 실행
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \start, s.sampleRate * 40, \amp, 0.0]);
~ululung_fil = Pdef(\seq_fff, Pbind(\amp, 0)).play;
~syn_buf_shopping.set(\amp, 0.4); // fade in
~syn_buf_shopping.set(\amp, 0.1); // fade out

// 마지막 작품 같이 보시면서...
~syn_buf_shopping.release(4.0);
// ~syn_buf_bts.release(3.0);
)


// 멘트
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]);
~mic1.set(\amp, 0.9);
~mic1.free;


// 그다음 '트위스트' : 음악 없음, 치유


~mic1.free;
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]);

// 홈쇼핑 중간부터 : "완판" 됐습니다!
// 음악 중간 부터 다시 나온다. - 아래 두 줄 순차 실행
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]);
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \start, s.sampleRate * 20, \amp, 0.0]);
~syn_buf_shopping.set(\amp, 0.3);

~mic1 = Synth(\micin, [\amp, 1.0]);
~syn_buf_shopping.set(\amp, 0.1);

// 암전 되고 나서 음악 페이드아웃
~mic1.free; // 민씨 마이크 off
~syn_buf_shopping.release(4.0);




// 혜림씨 세숫대야 솔로 : 음악 없음, 정아씨 라이브로 나레이션?
~mic = Synth(\micin, [\amp, 1.0]);



//---------------- 게임 씬 ----------------
// 예술작품을 평가하는 것이 과연 가능한 것인지... 다음에 음악 go
// 베이스 좀 약하게
(// 혜림씨가 세숫대야 겹치면 끝나면 음악 먼저
~mic.free; // 정아씨 마이크 off
~mic1 = Synth(\micin, [\amp, 1.0, \in, 1]); // 민하씨 마이크 on

// game bgm
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~div = 4;
~div2 = ~div/2;
~key = -4;
~key2 = ~key - 16;
~key3 = ~key - 1 + 12;
~fadeOutTime_game = 4.0;


~amp_game = 0.6;
~amp_game_b = ~amp_game*0.25;
~amp_game_c = ~amp_game*~amp_game_b - 0.05;
~amp_game_a = ~amp_game*~amp_game_b - 0.15;
// ~amp_game_a = ~amp_game_b = ~amp_game_c = 0;

~g1 = Pdef(\seq_game_1,
	Pbind(
		\instrument, \gobeat,
		// \instrument, \lfp,
		// \instrument, "help-TCoin",
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
).quant_(0);
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
).quant_(0);
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
	).quant_(0);
~g3.fadeTime = ~fadeOutTime_game;

~g1.play;~g2.play;~g3.play;

)


(// game bgm fade out

TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~div = 4;
~div2 = ~div/2;
~key = -4;
~key2 = ~key - 16;
~key3 = ~key - 1 + 12;
~fadeOutTime_game = 2.0;


~amp_game = 0;
~amp_game_b = 0;
~amp_game_c = 0;
~amp_game_a = 0;
// ~amp_game_a = ~amp_game_b = ~amp_game_c = 0;

~g1 = Pdef(\seq_game_1,
	Pbind(
		\instrument, \gobeat,
		// \instrument, \lfp,
		// \instrument, "help-TCoin",
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
).quant_(0);
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
).quant_(0);
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
	).quant_(0);
~g3.fadeTime = ~fadeOutTime_game;

~g1.play;~g2.play;~g3.play;

)

(// 다시 틀기 전에  반드시 stop 하거나 cmd + . 할 것
~g1.stop;~g2.stop;~g3.stop;
)


// 두번째 라운드 사운드 대결 준비 해야 함.









