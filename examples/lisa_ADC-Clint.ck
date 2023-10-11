// get the analog-to-digital converter and chucK it into a reverb

adc => NRev rev => LiSa lisa;
lisa => dac;
0.3 => rev.mix;

// we define a beat
0.5::second => dur beat;

4::beat => lisa.duration;
//start recording
1 => lisa.record;

// advance time
3::second => now;
//stop recording
0 => lisa.record;
// play the recording
1 => lisa.play;

// more 
// a while loop
while (true)
{
    0::beat => lisa.playPos; // set the playhead
    [0.25, 0.5, 1.0, 1.5, 2.0] @=> float rates[];
    rates[Math.random2(0, 4)] => lisa.rate;
    0.55::beat => now;
}
