// here we will extend the Chugraph class to create an acid synth a la 303
// we will play the synth with a basic sequencer


// the VCF - voltage controlled filter
class VCF extends Chugraph
{
     SawOsc lfo => blackhole;
     ADSR fenv => blackhole;
     

    
     inlet => LPF lpf => outlet;
     // set initial ADSR parameters
    (1::ms, 200::ms, 0, 20::ms) => fenv.set;
    
    // vcf switch     
     1 => int isOff;
     
     6 => lfo.freq;
     (400, 4.9) => lpf.set;
     
     fun void trig()
     {
         0.0 => lfo.phase;
         fenv.keyOff();
         fenv.keyOn();
     }
     
     fun void computeCutoff()
     {
         
         while(1)
         {
         1800 + lfo.last() * 700 => lpf.freq;
         
         10::ms => now;
         } 
     }

} 


// the synthsiser
class AcidSynth extends Chugraph

{
    // a Chugraph has an inlet and an outlet to "communicate" with the outside world
    SawOsc saw => Gain mixer => VCF vcf => ADSR env =>outlet;
    
    // filter envelope sucked by a blackhole
    // set initial ADSR parameters
    (1::ms, 180::ms, 0.3, 120::ms) => env.set;
    // intial cutoff and filter reso
   

   // play a note
   fun void play(int midiNote)
   {
       // only if the note is not 0, we play it
       if (midiNote > 0)
       {
           // convert the midi note into freq
       Std.mtof(midiNote) => saw.freq;
       // trig the envelope
       env.keyOff();
       env.keyOn();
        
       if (vcf.isOff == 1)
       {
       
       spork ~vcf.computeCutoff();
       0 => vcf.isOff;
       }
            }
   }
   
}

// ##############################################

// we must creat an instance of AcidSynth to use it
AcidSynth acid => JCRev rev => dac;

0.05 => rev.mix;

// an array of 8 integers, values from 1 to 128 are interpreted as notes
// 0 are rests 
[38 , 0, 0, 26 , 0, 0, 46, 32, 0] @=> int pattern [];

0 => int step;  // sequencer starts at step 0

while (1)

{
    // run through the sequencer
    acid.play(pattern[step%pattern.cap()]); // modulo is your best friend!
    118::ms => now;
    step ++;
    
}

