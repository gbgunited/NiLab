First index is ground state potential v, second index is excited state potential v (all 1-indexed)
So e.g. (26,71) would give fcf from v=26 in a3sigma to v=71 in c3sigma.





previously:
So the closest one I find matching your description is v=71, first free atom/trap state is v=75 (all 1-indexed). It is calculated to be -28GHz from threshold (probably close enough to your ~30GHz given how sensitive the calculation is for close to threshold states). See below plot for relative values of fcf's (not quite the absolute largest, but largest compared to neighbors). 

FCF fom a3sigma v=26 (motional ground state) to c3sigma v=71 is 5.8387e-4.
FCF from a3sigma v=25 (most weakly bound state) to c3sigma v=71 is -0.1960.

Note that these are the "bare" fcf's (just the wavefunction function overlap), and depending on what you are calculating you may need to take the square. 
These numbers were calculated for 70kHz trap.