// soundbuffer is used to play audio file

SndBuf sampler => dac;

// we store the sample variable in a string
me.dir() + "/samples" => string samplesDir;

// we load the desired sample
samplesDir + "CP_middle909.aiff" => sampler.read();


<<< samplesDir >>> ;