

!!!!!! Audio midi setup 에서 samplerate가 44100 인지 확인할 것 !!!!!!


(
Buffer.freeAll;

// prepare buffer
~path_ = "/Users/giy/Library/Mobile Documents/com~apple~CloudDocs/2018_06_ml/audio_sample/";

~buf_intro = Buffer.read(s, ~path_ ++ "0_major_interview.wav");

~buf_mozart = Buffer.read(s, ~path_++"1_1_mozart.wav");
~buf_beethoven = Buffer.read(s, ~path_++"1_2_beethoven.wav");
~buf_sari = Buffer.read(s, ~path_++"1_3_sari.wav");

~buf_shopping = Buffer.read(s, ~path_++"2_1_shopping.wav");
~buf_handaesoo = Buffer.read(s, ~path_++"2_2_handaesoo.wav");
~buf_cello = Buffer.read(s, ~path_++"2_3_cello.wav");
~buf_bts = Buffer.read(s, ~path_++"2_4_bts.wav");

// synthdef
SynthDef(\play_buffer, { arg t_trig = 0, out = 0, bufnum, gate = 1, susLevel = 0.8, amp = 0.8, start = 0;
    Out.ar( out,
		PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum), startPos: start)
		* EnvGen.kr(Env.adsr(sustainLevel: susLevel), gate, doneAction: 2) * amp;
    )
}, [0, 0, 0, 0, 0, 10, 0]).add;


// synthdef - modi
SynthDef(\play_buffer_m, {
	arg t_trig = 0, out = 0, bufnum, gate = 1, susLevel = 0.8,
	amp = 0.8, start = 0, spd = 4, atk = 1, rel = 2, curv = -4, rate = 1;
	var trig;
	// trig = Impulse.kr(10, mul: 0.5, add: 0.5);
	trig = LFPulse.kr(spd);
    Out.ar( out,
		PlayBuf.ar(2, bufnum, rate*BufRateScale.kr(bufnum), startPos: start, trigger: trig)
		// * EnvGen.kr(Env.perc(atk, rel, curv), gate, doneAction: 2) * amp;
		* EnvGen.kr(Env.adsr(sustainLevel: susLevel), gate, doneAction: 2) * amp;
    )
}, [0, 0, 0, 0, 0, 10, 0]).add;


)





// argument rate test
(
SynthDef(\tt, {|amp = 1.0, freq = 300|
	var sig = WhiteNoise.ar(amp);
	var sig2 = SinOsc.ar(freq, mul: amp);
	Out.ar(0, Pan2.ar(sig2, 0, 1));
}, [20, 20]).add;
)

a = Synth(\tt);
a.set(\amp, 0.0);
a.set(\amp, 1.0);
a.set(\freq, 100);



// play buffer
~syn_buf_intro = Synth.new(\play_buffer, [\bufnum, ~buf_intro, \amp, 0.8]);
~syn_buf_intro.set(\amp, 0.2);
~syn_buf_intro.release(0.3);

~syn_buf_mozart = Synth.new(\play_buffer, [\bufnum, ~buf_mozart, \amp, 0.8]);
~syn_buf_mozart.set(\amp, 0.2);
~syn_buf_mozart.release(0.3);

~syn_buf_beethoven = Synth.new(\play_buffer, [\bufnum, ~buf_beethoven, \amp, 0.8]);
~syn_buf_beethoven.set(\amp, 0.2);
~syn_buf_beethoven.release(0.3);

~syn_buf_sari = Synth.new(\play_buffer, [\bufnum, ~buf_sari, \amp, 0.8]);
~syn_buf_sari.set(\amp, 0.2);
~syn_buf_sari.release(0.3);

~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping, \amp, 0.8]);
~syn_buf_shopping.set(\amp, 0.2);
~syn_buf_shopping.release(0.3);

~syn_buf_handaesoo = Synth.new(\play_buffer, [\bufnum, ~buf_handaesoo, \amp, 0.8]);
~syn_buf_handaesoo.set(\amp, 0.2);
~syn_buf_handaesoo.release(0.3);

~syn_buf_cello = Synth.new(\play_buffer, [\bufnum, ~buf_cello, \amp, 0.8]);
~syn_buf_cello.set(\amp, 0.2);
~syn_buf_cello.release(0.3);

~syn_buf_bts = Synth.new(\play_buffer, [\bufnum, ~buf_bts, \amp, 0.8]);
~syn_buf_bts.set(\amp, 0.2);
~syn_buf_bts.release(0.3);


// stop or release
~syn_buf_shopping.release(0.3);
~syn_buf_shopping.free;
~syn_buf_cello.release(3.0);
~syn_buf_bts.release(1.2);
