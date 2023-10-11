fun void playDrumPattern(int pattern[], SndBuf sampler, dur stepTime)
{
    0 => int step; // we start at step 0   
    pattern.size() => int patternLength;
    
    while(true)
    {
        if (pattern[step%patternLength] == 1)
        {
            0 => sampler.pos;
            sampler.play();
        }
        // advance time
        stepTime => now;
         // increment step
     step ++;
        
    }   
} 

// soundbuffer is used to play audio file

SndBuf snare => dac;
SndBuf rim => dac;
SndBuf kick => dac;

// we store the sample variable in a string
me.dir() + "../samples/" => string samplesDir;

"CP_middle909.aiff" => string snareName;
"Rimshot_std808.aiff" => string rimName;
"BD_heavy909.aiff" => string kickName;
// we load the desired sample
samplesDir + clapName => clap.read;
samplesDir + rimName => rim.read;
samplesDir + kickName => kick.read;

[1, 0, 1, 0, 1, 0, 1, 0, 0, 0] @=> int clapPattern [];


// we spork the children
spork ~playDrumPattern(clapPattern, clap, 120::ms);
spork ~playDrumPattern(clapPattern, rim, 250::ms);
spork ~playDrumPattern(clapPattern, kick, 400::ms);


// parent process - we need one
while (true)
{    
1::second => now;
}

