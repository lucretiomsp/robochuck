// LiSa ChucK LiveSampler

SinOsc osc => ADSR env => NRev rev => dac;
// take the input of the reverb into lisa
rev => LiSa lisa => dac;

880 => osc.freq;
0.24 => osc.gain;


(1::ms, 5::ms, 0, 1::ms) => env.set;

0.2 => rev.mix;

// we define a beat
0.5::second => dur beat;

4::beat => lisa.duration;
//start recording
1 => lisa.record;
// play the note
1 => env.keyOn;
// advance time
4::beat => now;
//stop recording
0 => lisa.record;
// play the recording
1 => lisa.play;

// more 
// a while loop\
while (true)
{
    0::beat => lisa.playPos; // set the playhead
    [0.25, 0.5, 1.0, 1.5, 2.0] @=> float rates[];
    rates[Math.random2(0, 4)] => lisa.rate;
    0.25::beat => now;
}
