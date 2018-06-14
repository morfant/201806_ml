(
~masterEQ.gui.onSelect('bts');
a.free;
a = Synth(\play_buffer_m, [\bufnum, ~buf_bts, \amp, 0.4, \out, 100]);
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
		\fm_freq, Pseq([2300, 2600, 3000, 4000]*2, inf),
		\fm_amp, 0.8,
		\addamp, 0.6,
        \amp, 0.7,
		\atktime, 0.1,
		\sustime, 0.9,
		\reltime, 0.1,
		\addAction, 1


	)
).quant_(0).play;
~ululung_fil.fadeTime = 2.0;
)