~syn_buf_bts = Synth.new(\play_buffer_m, [\bufnum, ~buf_bts, \amp, 0.1, \spd, 2, \start, 2]);
~syn_buf_bts.set(\spd, 2, \start, s.sampleRate*3.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 2, \start, s.sampleRate*4.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 2, \start, s.sampleRate*5.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 3, \start, s.sampleRate*3.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 4, \start, s.sampleRate*3.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 5, \start, s.sampleRate*3.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 2, \start, s.sampleRate*7.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 1, \start, s.sampleRate*15, \rate, 1);
~syn_buf_bts.set(\amp, 0.2);
~syn_buf_bts.release(0.3);


~syn_buf_bts = Synth.new(\play_buffer, [\bufnum, ~buf_bts, \amp, 0.1]);


(

//bts
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~ululung = Pdef(\seq_uuu,
	Pbind(
		\instrument, \play_buffer_m,
		\bufnum, ~buf_bts,

		// \fil_freq, Pseq([2000], inf),
        \amp, 0.3,

	)
).quant_(0).play;
~ululung.fadeTime = 3.0;

)

// fadeout
~ululung = Pdef(\seq_uuu, Pbind(\amp, 0)).play;


a = Synth(\play_buffer_m, [\bufnum, ~buf_bts, \amp, 0.2, \out, 100]);
f = Synth(\fil, [\in_bus, 100, \freq, 1000]);
f.set(\freq, 100);
f.set(\freq, 1000);
f.set(\freq, 2000);

(
a.free;
a = Synth(\play_buffer_m, [\bufnum, ~buf_bts, \amp, 0.2, \out, 100]);
// a = Synth(\play_buffer_m, [\bufnum, ~buf_bts, \amp, 0.2, \out, 0]);
//bts
TempoClock.default.tempo_(60/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~ululung_fil = Pdef(\seq_fff,
	Pbind(
		\instrument, \fil,
		\dur, 1,
		\delta, 1,
		\freq, 20000,
		\ping_amp, 0.20,
		\ping_freq, 22000,

		// \freq, Pseq([20, 100, 100, 10, 20, 30, 60, 120]*60, inf),
		// \freq, Pseq([2000, 100, 3000, 600], inf),
		// \freq, 100,
		// \addamp, Pseq([1, 1.0], inf),
		\rq, 1,
        \amp, 0.3,
		// \freq_tri, Pseq([10, 2, 1, 20, 100, 1000, 10000], inf),
		// \amp_tri, 1,
		\atktime, 0.1,
		\sustime, 0.9,
		\reltime, 0.1,
		\addAction, 1


	)
).quant_(0).play;


)
