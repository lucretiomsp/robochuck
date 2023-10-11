// a square wave at 300 hz for 3 seconds
SqrOsc sqr => dac;

// set frequency
300 => sqr.freq;
// set gain 
0.5 => sqr.gain;

// play for 3 seconds
3::second => now;