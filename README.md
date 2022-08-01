# find-synchronous-events


This code will take preprocessed and parcellated fMRI BOLD data, run event detection, and identify the frames that qualify as synchronous events.  The code requires selection of a null model, either using resting-state data, or a circularly shifted version of the primary data in order to create a null distribution that quantifies how likely we are to see across participant synchrony by chance.  Our results used resting-state data as the null, as we found it to be a more conservative estimate of the frames that qualify as synchronous events (see figure S6 in the paper referenced below).

This code can be used on any preprocessed and parcellated fMRI BOLD data where participants share the same stimuli, and the stimuli is time-locked to the same frames (e.g. stimuli #1 is in frame #10 in all subjects time series).


Included with this code is example data that can be used to demo the code.  (The example data provided here was also used as our replication dataset in the paper referenced below)



Tanner, J. C., Faskowitz, J., Byrge, L., Kennedy, D., Sporns, O., & Betzel, R. (2022). Synchronous high-amplitude co-fluctuations of functional brain networks during movie-watching. bioRxiv.
