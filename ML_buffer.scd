

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

);


( // synthdef
SynthDef(\play_buffer, { arg out = 0, bufnum, gate = 1, susLevel = 0.8;
    Out.ar( out,
		PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum))
		* EnvGen.kr(Env.adsr(sustainLevel: susLevel), gate, doneAction: 2);
    )
}).add;
)



// play buffer
~syn_buf_intro = Synth.new(\play_buffer, [\bufnum, ~buf_intro]);
~syn_buf_mozart = Synth.new(\play_buffer, [\bufnum, ~buf_mozart]);
~syn_buf_beethoven = Synth.new(\play_buffer, [\bufnum, ~buf_beethoven]);
~syn_buf_sari = Synth.new(\play_buffer, [\bufnum, ~buf_sari]);
~syn_buf_shopping = Synth.new(\play_buffer, [\bufnum, ~buf_shopping]);
~syn_buf_handaesoo = Synth.new(\play_buffer, [\bufnum, ~buf_handaesoo]);
~syn_buf_cello = Synth.new(\play_buffer, [\bufnum, ~buf_cello]);
~syn_buf_bts = Synth.new(\play_buffer, [\bufnum, ~buf_bts]);


// stop or release
~syn_buf_shopping.release(0.3);
~syn_buf_shopping.free;
~syn_buf_cello.release(3.0);
~syn_buf_bts.release(1.2);
