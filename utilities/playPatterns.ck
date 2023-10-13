public class Pattern {

// static functiona and members are associated with the class, not with the instance

fun static void playDrumPattern(int pattern[], SndBuf sampler, dur stepTime)
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

// 	"generates an euclidean rhythm with  onsets and pulses, algorithm based on the Bresenham approach"
fun static int[] euclideanRhythm (float onsets, int pulses)
{   
    0 => int current;
    1 => int previous;
    int result[pulses];
    onsets / pulses => float slope;
    
    for (0 => int i; i < pulses -1; i++)
    {
        // $ sign is for explicit cast
        (i * slope) $ int => current;
        if ( current != previous)
        {
            1 => result[i];
        } else {
           0  => result[i];
        }
        current => previous;
    }
        return result;
}

// end of class declaration
}
