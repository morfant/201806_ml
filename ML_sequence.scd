
//TODO
- 모던에서 일정한 박자 소리가 좀 더 잘 들리게. (?)




//change tempo
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.


// ======================================= Sequence ===========================================
~masterEQ.gui.onSelect('interview');
// 인트로 사운드 : 무용수 세 명 나와서 자리 잡으면 go : 하이가 좀 쎈가?
~syn_buf_intro = Synth.new(\play_buffer, [\bufnum, ~buf_intro, \amp, 0.8]);
~syn_buf_intro.set(\amp, 0.8);
~syn_buf_intro.release(0.3);




// 중고음 조금 빼기
// 인트로에서 민하씨가 "~에서 ~를 빼면" 하면 하고 조명 완전히 (천천히) 암전 되면 go
(
~masterEQ.gui.onSelect('ancient');
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~syn_buf_anc_rec = Synth.new(\play_buffer, [\bufnum, ~buf_anc_rec, \amp, 0.75]);
~syn_buf_anc_rec.set(\amp, 0.8);
)



// 혜림씨 탑 조명 들어오고 모내기 3번 하고 나면 '농협' 인터뷰 go
~syn_buf_voice_haerim = Synth.new(\play_buffer, [\bufnum, ~buf_voice_haerim, \amp, 0.6]);
~syn_buf_voice_haerim.set(\amp, 0.6);
~syn_buf_voice_haerim.release(0.3);


// 정아씨 멘트: "섞여 있었다."로 끝

// 중세
// 무용수들 모두 고대 옷 벗고 월계관 벗어 놓고 민, 태이씨 뒤로 두 걸음 걸어 나와서 서면 전환 (빠른 것 보다는 조금 늦는게 낫다)
(
// 중세 비트 속도
~syn_buf_anc_rec.release(1.0);
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~masterEQ.gui.onSelect('med');
~syn_buf_med_rec = Synth.new(\play_buffer, [\bufnum, ~buf_med_rec, \amp, 1.6]);
)


// 무용수들 무대를 가로질러 조각처럼 선다.
// 멘트: 점진적인 변화가 시작된다
// 태이씨 의자를 가지고 하수 탑에 선다.
// 멘트: 과학의 승리로 일반화 된다.


// 중세 오르간 음악은 태이씨 이외의 무용수들이 모두 나가고, 태이씨 망원경 다 피고 나면! 탑 조명 들어오면 페이드로 나간다.
// 이때 태이씨 나레이션 go
(
~syn_buf_med_rec.release(4.0);~syn_buf_voice_taei = Synth.new(\play_buffer, [\bufnum, ~buf_voice_taei, \amp, 0.6]);
)


// 태이씨 나레이션 끝나면 중세 음악이 살짝 다시 들어온다. (fade in 처리!!)
~syn_buf_med_rec = Synth.new(\play_buffer, [\bufnum, ~buf_med_rec, \amp, 0.4]);
~syn_buf_med_rec.set(\amp, 0.5);


// 정아씨가 '장인의 운명' 하고, 최여사님 탑 조명 들어오면 최여사님 나레이션 나온다. (여기도 조명이 완전히 바뀌는
~syn_buf_voice_mom = Synth.new(\play_buffer, [\bufnum, ~buf_voice_mom, \amp, 0.5]);
~syn_buf_voice_mom.set(\amp, 0.5);
~syn_buf_voice_mom.release(0.3);


// 최여사님 무대 밖으로 나갈때 음악 같이 아웃. 아웃 하면서 정아씨 다음 멘트로 이어짐
(~syn_buf_med_rec.release(4.0);)

// 정아씨 멘트

// 모자르트 음악. : "~정당성을 부여했다." 끝나면, 무대위 무용수들이 천을 완전히 잡으면(?). go
~masterEQ.gui.onSelect('x_flat');
~syn_buf_mozart = Synth.new(\play_buffer, [\bufnum, ~buf_mozart, \amp, 0.5]);
~syn_buf_mozart.set(\amp, 0.9);
~syn_buf_mozart.release(0.3);


// 정아씨 멘트 (천 바닥에 떨어지고 나면)

// "사리야" : "사리야 예술가의 속성 알려줘." 끝나면 1초 쉬고 go
~syn_buf_sari = Synth.new(\play_buffer, [\bufnum, ~buf_sari, \amp, 0.4]);
~syn_buf_sari.set(\amp, 0.2);
~syn_buf_sari.release(0.3);

// cmd . 할 수 있는 포인트

// "쉿" : 정아씨 마이크


// 베토벤 음악 : 사리야 끝나고 모두 퇴장했다가 다시 들어와서 (정아-태이-세번째 쉿-네번째 쉿-다선번째 쉿)'쉿' 소리 5번 듣고 암전 완성되면 음악 go
~masterEQ.gui.onSelect('btv');
~syn_buf_beethoven = Synth.new(\play_buffer, [\bufnum, ~buf_beethoven, \amp, 0.8]);
~syn_buf_beethoven.set(\amp, 0.8);
~syn_buf_beethoven.release(5.0);


// 민하씨 사진 찍을때 정아씨 멘트


// "모던이다"
// 3. 모던(찰칵찰칵, 컨베이어, 코카콜라, 좀더 팝댄스?)
(
~masterEQ.gui.onSelect('mod');
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~fadeOutTime_mod = 6.0;
~amp_mod_a = 1;
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
		\amp, ~amp_mod_a*4/6

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
		\amp, ~amp_mod_a*4/5

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



(// 민씨 의자 가지고 나올 때 천천히! // 피아노 소리 fade in, 조금 작게 (극장에서 볼륨 체크 할 것)
~c3.stop;
~keyaaa = -3;
// base rytm
~c4 = Pdef(\seq_mod_4,
	Pbind(
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
		\amp, Pseq([0.2, 0.4, 0.4, 0.4, 0.32]/7, inf),
		// \amp, 0.5

	)
// ).quant_(4).play;
).quant_(0).play;
~c4.fadeTime = ~fadeOutTime_mod;
)


(// 피아노 소리 fade out: 민씨 의자 들고 나가기 시작하면 천천히!
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
~c4.stop;~syn_buf_outtro_wave = Synth.new(\play_buffer, [\bufnum, ~buf_outtro_wave, \amp, 1.7]);
~syn_buf_outtro_wave.set(\amp, 1.7);
~syn_buf_outtro_wave.release(0.3);


(// 다시 피아노 fade in (극장에서 볼륨 체크 할 것) : 약간 텀을 두고
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
		\amp, Pseq([0.2, 0.4, 0.4, 0.4, 0.32]/7, inf),
		// \amp, 0.5

	)
// ).quant_(4).play;
).quant_(0).play;
~c4.fadeTime = ~fadeOutTime_mod;
)


// 인터미션 안내에도 마이크?



// modern stop : 5분간 인터미션이 있겠습니다 후 조명 나가고 나서 페이드 아웃
(
~c1 = Pdef(\seq_mod_1, Pbind(\amp, 0));
~c2 = Pdef(\seq_mod_2, Pbind(\amp, 0));
~c3 = Pdef(\seq_mod_3, Pbind(\amp, 0));
~c4 = Pdef(\seq_mod_4, Pbind(\amp, 0));

// ~c1.play;~c2.play;~c3.play;~c4.play;
)


//stop
(~c1.stop;~c2.stop;~c3.stop;~c4.stop;)

// 소리 다 잦아들면
// cmd + .


--------- 2 막 ----------
// !!!!!!!!!!!!**** 무선 마이크 리시버 켜져 있는지 체크 ****!!!!!!!!!!!!
// mic 테스트


// ======== 홈쇼핑 : 암전에서(하우스가 꺼지면) 시작 먼저, 마이크 on ========
~masterEQ.gui.onSelect('x_flat');
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \amp, 0.4]);
~syn_buf_shopping.set(\amp, 0.11); // 소리 줄어듬
~syn_buf_shopping.set(\amp, 0.4); // 소리 커짐
~syn_buf_shopping.release(4.0);


// ======== 한대수 ========
// 멘트: 첫번째 작품 시작하겠습니다.


// 중간에 민 씨 멘트 있음
// 한대수 : 민하씨가 태이씨한테 벽돌을 뺏어서 바닥에 찍을 때, 중간에 민씨 멘트할 때, 작아졌다 커진다. 두 사람 함께 나갈때 페이드 아웃
~syn_buf_handaesoo = Synth.new(\play_buffer, [\bufnum, ~buf_handaesoo, \amp, 0.4]);
~syn_buf_handaesoo.set(\amp, 0.2);
~syn_buf_handaesoo.set(\amp, 0.4);
~syn_buf_handaesoo.release(4.0);

//끝나자 마자 멘트


// ======== 여자의정원 ========
// 멘트: 민씨 합류 했다가 다시 나오면서 멘트 또 있다.
// 여자의 정원 : 세 분 모여서 민씨 뒷모습 보이고 살랑살랑 3번 하고 나면 go
~syn_buf_cello = Synth.new(\play_buffer, [\bufnum, ~buf_cello, \amp, 0.6]);~mic1.free;
~syn_buf_cello.set(\amp, 0.7);
~syn_buf_cello.set(\amp, 0.2);
~syn_buf_cello.release(8.0);


// 멘트


// 여자의 정원 끝나면, 개념무용 음악 먼저 go

(// 개념 무용 : 실행만 - 소리는 안남
var ampMul = 0;

TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
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

(// 개념 무용 동작은 무 들고 뛰어 다니기 : fade in 타임을 좀 길게

var ampMul = 0.43;
~masterEQ.gui.onSelect('concept_dance');
// 민씨 움직이며 멘트


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


// 민씨 "네!~" 하면 개념무용 fade out
(// fadeout
~con = Pdef(\seq_concept_1, Pbind(\instrument, \condan, \amp, 0)).play;
)

~con.stop;


// 멘트


// 나 정말 으르렁 대
// 태이씨 동작에 맞춰야 함 : 2 * 8 듣고 go - 태이씨 덩실덩실 다음 앞으로 손 내리칠 때 go
// 무용수들 나갈때 으러렁과 다음 홈쇼핑 음악 오버랩
(
~masterEQ.gui.onSelect('bts');
~syn_buf_bts = Synth.new(\play_buffer, [\bufnum, ~buf_bts_rec, \amp, 1.3]);
)


// 민씨 다시 멘트
~syn_buf_bts.set(\amp, 0.7);


(// "놓치지 않았으면 좋겠어요.. ". 으르렁 -> 홈쇼핑 음악으로 오버랩
// 아래 세 줄 순차 실행
~masterEQ.gui.onSelect('x_flat');
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \start, s.sampleRate * 40, \amp, 0.0]);
~syn_buf_bts.release(4.0);~syn_buf_shopping.set(\amp, 0.12);

// 마지막 작품 같이 보시면서...
~syn_buf_shopping.release(4.0);
// ~syn_buf_bts.release(3.0);
)


// 멘트


// 그다음 '트위스트' : 음악 없음, 치유

// 홈쇼핑 중간부터 : 전화 연결 하고 나서 "완판" 됐습니다!
// 음악 중간 부터 다시 나온다. - 아래 두 줄 순차 실행
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \start, s.sampleRate * 20, \amp, 0.0]);
~syn_buf_shopping.set(\amp, 0.20);

// 암전 되고 나서 음악 페이드아웃: 좀 길게
~syn_buf_shopping.release(4.0);


// 혜림씨 세숫대야 솔로 : 음악 없음, 정아씨 라이브로 나레이션?


/*----------------------- 메이져 게임 씬 -----------------------*/
(// 혜림씨 세숫대야 씬 끝내면서 세숫대야 두개를 겹칠때 '철커덕' 하고 나서 go
~masterEQ.gui.onSelect('game');

// game bgm
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~div = 4;
~div2 = ~div/2;
~key = -4;
~key2 = ~key - 16;
~key3 = ~key - 1 + 12;
~fadeOutTime_game = 4.0;


~amp_game = 0.2;
~amp_game_a = ~amp_game*0.2;
~amp_game_b = ~amp_game*0.15;
~amp_game_c = ~amp_game*0.2;
// ~amp_game_a = ~amp_game_b = ~amp_game_c = 0;


// melody fast
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

// bass
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


// melody slow
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


/*----------------------- 사운드 대결 -----------------------*/
(//music A - start!!!
var music_A_fadeTime = 3.0;
~masterEQ.gui.onSelect('music_a');
~g1.stop;~g2.stop;~g3.stop;
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~amp_music_a = 3.5;
~music_A = Pdef(\seq_music_a,
	Pbind(
		\instrument, \woong,
		\dur, Pseq([
			Pseq([1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\freq2, Pseq([
						Pseq(([108, 105, 105, 105]).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd2).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd2).midicps, 1),
			], inf),
		\freq3, Pseq([
						Pseq(([108, 105, 105, 105]).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd3).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd3).midicps, 1),
			], inf),
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1, 1, 1, 1]/9, 1), // original
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25]/9, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1]/9, 1),
			], inf),
		// \sn, Pseq((80..8), 1),
		// \sn, 1,
		\sn, 8,
		// \sn, Pseq([8, 100, 8, 8, 800, Prand([500, 300, 2], 1), 8, 8], inf),
		\amp, 0.9*~amp_music_a,
		// \cutoff, 400,
		\cutoff, Pseq([100, 200, 400, 600, 500, 200, 1800, 200]/4, inf),
		// \cutoff, Pseq([100, 200, 400, 200, 500, 200, 500, 500], inf),
		\rq, 0.9

	)
// ).quant_(4).play;
	).quant_(0).play;
~music_A.fadeTime = music_A_fadeTime;

)

(//music A - fadeOut
var music_A_fadeTime = 3.0;
~masterEQ.gui.onSelect('music_a');
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~amp_music_a = 0;
~music_A = Pdef(\seq_music_a,
	Pbind(
		\instrument, \woong,
		\dur, Pseq([
			Pseq([1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\freq2, Pseq([
						Pseq(([108, 105, 105, 105]).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd2).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd2).midicps, 1),
			], inf),
		\freq3, Pseq([
						Pseq(([108, 105, 105, 105]).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 44, 44]+~freqAdd3).midicps, 1),
		// 	Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd3).midicps, 1),
			], inf),
		// \freq4, Pseq(([~freq4]).midicps, inf),
		\delta, Pseq([
			Pseq([1, 1, 1, 1]/9, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25]/9, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1]/9, 1),
			], inf),
		// \sn, Pseq((80..8), 1),
		// \sn, 1,
		\sn, 8,
		// \sn, Pseq([8, 100, 8, 8, 800, Prand([500, 300, 2], 1), 8, 8], inf),
		\amp, 0.9*~amp_music_a,
		// \cutoff, 400,
		\cutoff, Pseq([100, 200, 400, 600, 500, 200, 1800, 200]/4, inf),
		// \cutoff, Pseq([100, 200, 400, 200, 500, 200, 500, 500], inf),
		\rq, 0.9

	)
// ).quant_(4).play;
	).quant_(0);
~music_A.fadeTime = music_A_fadeTime;

)



(//music B start

var music_B_fadeTime = 3.0;
~music_A.stop;
~masterEQ.gui.onSelect('music_b');
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~amp_music_b = 1.5;

~music_B_1 = Pdef(\seq_long,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			// Pseq([1, 1, 1, 1, 0.5, 0.5]/16, 1),
			Pseq([1, 1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]-12-12).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1, 1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 1.0*~amp_music_b,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff, Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
		], inf),
		// \cutoff, 500,
		\rq, 0.9,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_1.fadeTime = music_B_fadeTime;



~music_B_2 = Pdef(\seq_long2,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1, 3]/6, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1, 6]/2, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.2/2/2*~amp_music_b,
		// \amp, 0,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff,
		Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			// Pseq([500, 450], 1),
		// Ppar([
			// Pseq([500, 420, 350]+240, 1),
			Pseq([500, 420, 350], 1),
			// Pseq([500, 450], 1),
		// ], inf),
			], inf),
		// \cutoff, 500,
		\rq, 0.3,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_2.fadeTime = music_B_fadeTime;



~music_B_3 = Pdef(\seq_long3,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.03/2*~amp_music_b,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff,
		Pseq([
			Pseq([100, 50]*30, 1),
		], inf),
		// \cutoff, 500,
		\rq, 1.0,


	)
// ).quant_(4).play;
	).quant_(0).play;
~music_B_3.fadeTime = music_B_fadeTime;



)



(// music B fade out
var music_B_fadeTime = 3.0;
TempoClock.default.tempo_(55/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~amp_music_b = 0;

~music_B_1 = Pdef(\seq_long,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			// Pseq([1, 1, 1, 1, 0.5, 0.5]/16, 1),
			Pseq([1, 1, 1, 1, 1]/16, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\freq, Pseq([
			Pseq(([108, 105, 105, 105]-12-12).midicps, 1),
			// Pseq(([49, 56, 49, 56, 49, 44, 44, 49, 49]+~freqAdd).midicps, 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1, 1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 1.0*~amp_music_b,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff, Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
		], inf),
		// \cutoff, 500,
		\rq, 0.9,


	)
// ).quant_(4).play;
	).quant_(0);
~music_B_1.fadeTime = music_B_fadeTime;



~music_B_2 = Pdef(\seq_long2,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1, 3]/6, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1, 6]/2, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.2/2/2*~amp_music_b,
		// \amp, 0,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff,
		Pseq([
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500], 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/12, 1),
			// Pseq([100, 200, 400, 900, 500, 200, 1000, 500]/6, 1),
			// Pseq([500, 450], 1),
		// Ppar([
			// Pseq([500, 420, 350]+240, 1),
			Pseq([500, 420, 350], 1),
			// Pseq([500, 450], 1),
		// ], inf),
			], inf),
		// \cutoff, 500,
		\rq, 0.3,


	)
// ).quant_(4).play;
	).quant_(0);
~music_B_2.fadeTime = music_B_fadeTime;



~music_B_3 = Pdef(\seq_long3,
	Pbind(
		\instrument, \woonglong,
		\dur, Pseq([
			Pseq([1, 1]/4, 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),
		\delta, Pseq([
						Pseq([1, 1], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 0.75, 0.25], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 1, 1], 1),
			], inf),
		\amp, 0.03/2*~amp_music_b,
		// \cutoff, 400,
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 2000], inf),
		// \cutoff, Pseq([100, 200, 400, 900, 500, 200, 1000, 1500], inf),
		\cutoff,
		Pseq([
			Pseq([100, 50]*30, 1),
		], inf),
		// \cutoff, 500,
		\rq, 1.0,


	)
// ).quant_(4).play;
	).quant_(0);
~music_B_3.fadeTime = music_B_fadeTime;



)

(// game 음악 다시 go
~masterEQ.gui.onSelect('game');

// game bgm
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.
~div = 4;
~div2 = ~div/2;
~key = -4;
~key2 = ~key - 16;
~key3 = ~key - 1 + 12;
~fadeOutTime_game = 4.0;


~amp_game = 0.2;
~amp_game_a = ~amp_game*0.2;
~amp_game_b = ~amp_game*0.15;
~amp_game_c = ~amp_game*0.2;
// ~amp_game_a = ~amp_game_b = ~amp_game_c = 0;


// melody fast
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

// bass
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


// melody slow
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

// ~g1.play;~g2.play;~g3.play;

)





