

!!!!!! Audio midi setup 에서 samplerate가 44100 인지 확인할 것 !!!!!!


(
Buffer.freeAll;

// prepare buffer
~path_ = "/Users/giy/Library/Mobile Documents/com~apple~CloudDocs/2018_06_ml/audio_sample/";

~buf_intro = Buffer.read(s, ~path_ ++ "0_major_interview.wav");
~buf_voice_haerim = Buffer.read(s, ~path_ ++ "0_1_interview_haerim.wav");
~buf_voice_taei = Buffer.read(s, ~path_ ++ "0_2_interview_taei.wav");
~buf_voice_ch = Buffer.read(s, ~path_ ++ "0_3_interview_ch.wav");
~buf_voice_mom = Buffer.read(s, ~path_ ++ "0_5_interview_mom.wav");
~buf_outtro_end = Buffer.read(s, ~path_ ++ "0_4_interview_all.wav");
~buf_outtro_wave = Buffer.read(s, ~path_ ++ "0_4_interview_all_wave.wav");

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
	amp = 0.8, start = 0, spd = 4, atk = 1, rel = 2, curv = -4, rate = 1,
	fil_freq = 200, rq = 0.6;
	var trig, fil;
	// trig = Impulse.kr(10, mul: 0.5, add: 0.5);
	// trig = LFPulse.kr(spd);
    Out.ar( out,
		// RLPF.ar(
			PlayBuf.ar(
				2, bufnum, rate*BufRateScale.kr(bufnum), startPos: start, trigger: 1)
		// ,fil_freq, rq)
		* EnvGen.kr(Env.adsr(sustainLevel: susLevel), gate, doneAction: 2) * amp;
    )
}, [0, 0, 0, 0, 0, 20, 0]).add;


SynthDef(\fil, {
	arg freq = 20000, rq = 1.0, amp = 0.8, in_bus = 100, gate = 1,
	atktime = 0.1, sustime = 1, reltime = 0.5, addamp = 0.0, freq_tri = 20, amp_tri = 0.2,
	ping_amp = 0.5, ping_freq = 400, fm_freq = 10, fm_amp = 0.1;
	var sig = In.ar(in_bus);
	var amt = Amplitude.kr(sig, 0.2, 0.5);
	var sigfm = LFTri.kr(amt * fm_freq, mul: fm_amp);
	var sig3 = SinOsc.ar(amt * ping_freq * sigfm, mul: ping_amp);
	Out.ar(0, Pan2.ar(sig+(sig3*addamp), 0, amp) * EnvGen.kr(Env.linen(atktime, sustime, reltime), gate, doneAction: 2));
}).add;
)

Amplitude





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

~syn_buf_voice_haerim = Synth.new(\play_buffer, [\bufnum, ~buf_voice_haerim, \amp, 0.8]);
~syn_buf_voice_haerim.set(\amp, 0.2);
~syn_buf_voice_haerim.release(0.3);

~syn_buf_voice_taei = Synth.new(\play_buffer, [\bufnum, ~buf_voice_taei, \amp, 1.0]);
~syn_buf_voice_taei.set(\amp, 0.2);
~syn_buf_voice_taei.release(0.3);

~syn_buf_voice_ch = Synth.new(\play_buffer, [\bufnum, ~buf_voice_ch, \amp, 6.0]);
~syn_buf_voice_ch.set(\amp, 6.0);
~syn_buf_voice_ch.release(0.3);


// ~syn_buf_outtro_end = Synth.new(\play_buffer, [\bufnum, ~buf_outtro_end, \amp, 2.0]);
~syn_buf_outtro_wave = Synth.new(\play_buffer, [\bufnum, ~buf_outtro_wave, \amp, 2.0]);
~syn_buf_outtro_wave.set(\amp, 0.2);
~syn_buf_outtro_wave.release(0.3);



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
