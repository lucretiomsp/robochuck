// get the analog-to-digital converter and chucK it into a reverb

adc => NRev rev => dac;
0.3 => rev.mix;

// we want to record the file
dac => WvOut2 waveout => blackhole; 
me.dir() +"../adc-test.wav" => waveout.wavFilename;

5::second => now;