// soundbuffer is used to play audio file
SndBuf sampler => NRev rev => dac;

// FILEIO is the class to manipulate files
FileIO samplesFolder;

// we set the reverb amount
0.3 => rev.mix;

//  we store the name of the folder
me.dir() + "/../samples/" => string samplesFolderName; // /.. is to exit the current directory
// we open the folder
samplesFolderName => samplesFolder.open;
// we store the list of samples
samplesFolder.dirList() @=> string listOfSamples[ ];

// we store an index into the sample list
0 => int samplesIndex;

while (true)
{
    samplesIndex % listOfSamples.size() => int index; 
    samplesFolderName + listOfSamples[index] => sampler.read;
    0 => sampler.pos;
    sampler.play();
    
    // advance time
    200::ms => now; 
    // increment samplesIndex
    // samplesIndex ++;   
    
    // randomSampleIndex
    Math.random2(0, listOfSamples.size()) => samplesIndex;
}


//we can print to the console the list of the files in our folder
for (0 => int i; i < listOfSamples.size(); i ++)
{
<<< listOfSamples[i] >>> ;
}
<<< samplesFolderName + "Flipper.wav" >>>;