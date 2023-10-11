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

}