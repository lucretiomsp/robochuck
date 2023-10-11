// a square wave at 300 hz for 3 seconds
SqrOsc sqr => dac;

// 1  is always true
while (1)
{
    // a random freq between 30 and 900
    Math.random2f(30,900) => sqr.freq;
    // a random gain between 0 and 0.5;
    Math.random2f(0.5) => sqr.gain;
    
    //every 0.11 ms
    11::ms => now;
}