~syn_buf_bts = Synth.new(\play_buffer_m, [\bufnum, ~buf_bts, \amp, 0.1, \spd, 2]);
~syn_buf_bts.set(\spd, 2, \start, s.sampleRate*3.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 3, \start, s.sampleRate*3.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 4, \start, s.sampleRate*3.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 5, \start, s.sampleRate*3.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 2, \start, s.sampleRate*7.0, \atk, 0.1, \rel, 0.1);
~syn_buf_bts.set(\spd, 1, \start, s.sampleRate*15, \rate, 1);
~syn_buf_bts.set(\amp, 0.2);
~syn_buf_bts.release(0.3);



(

//bts
TempoClock.default.tempo_(40/60); // 기본 시계라고 생각하면 된다. 1.0.wait의 길이를 달라지게 한다.

~ululung = Pdef(\seq_uuu,
	Pbind(
		\instrument, \play_buffer_m,
		\bufnum, ~buf_bts,
		\dur, Pseq([
			Pseq([8], 1),
			// Pseq([1, 1, 1, 1, 1, 0.75, 0.25, 0.75, 1], 1),
		], inf),

		\spd, Pseq([1, 1, 1, 1, 1, 1, 1], inf),
		\start, Pseq([0]*s.sampleRate, inf),
		\delta, Pseq([
			Pseq([8], 1),
		], inf),
		\rate, Pseq([1, 1, 1, 1, 1, 1, 1, 1], inf),
		// \fil_freq, Pseq([Prand([500, 3000], 1), 300, 1000, 400, Prand([900, 300], 1), 2000], inf),
		\fil_freq, Pseq([2000], inf),
		// \rq, Pseq([0.5, 0.2, 0.2, 0.8, 0.2, 0.2], inf),
        \amp, 0.3,

	)
).quant_(0).play;
~ululung.fadeTime = 3.0;

)

// fadeout
~ululung = Pdef(\seq_uuu, Pbind(\amp, 0)).play;
