# Code for identifying synchronous high-amplitude cofluctuations, or 'events'


This code will take preprocessed and parcellated fMRI BOLD data, run event detection, and identify the frames that qualify as synchronous events.  The code requires selection of a null model, either using resting-state data, or a circularly shifted version of the primary data in order to create a null distribution that quantifies how likely we are to see across participant synchrony by chance.  Our results used resting-state data as the null, as we found it to be a more conservative estimate of the frames that qualify as synchronous events (see figure S6 in the paper referenced below).

This code can be used on any preprocessed and parcellated fMRI BOLD data where participants share the same stimuli, and the stimuli is time-locked to the same frames (e.g. stimuli #1 is in frame #10 in all subjects time series).


Included with this code is example data that can be used to demo the code.  (The example data provided here was also used as our replication dataset in the paper referenced below)



Tanner, J. C., Faskowitz, J., Byrge, L., Kennedy, D., Sporns, O., & Betzel, R. (2022). Synchronous high-amplitude co-fluctuations of functional brain networks during movie-watching. bioRxiv.

See below for a video of movie-stimuli and subject event synchronization, as well as the mean cofluctuation pattern at each frame:



https://user-images.githubusercontent.com/59493314/182236428-5e0db36d-9c88-4877-aa7a-9a5d7ea656c7.mp4



Other relevant event-related papers:

Zamani Esfahlani, F., Jo, Y., Faskowitz, J., Byrge, L., Kennedy, D. P., Sporns, O., & Betzel, R. F. (2020). High-amplitude cofluctuations in cortical activity drive functional connectivity. Proceedings of the National Academy of Sciences, 117(45), 28393-28401.

Betzel, R. F., Cutts, S. A., Greenwell, S., Faskowitz, J., & Sporns, O. (2022). Individualized event structure drives individual differences in whole-brain functional connectivity. NeuroImage, 252, 118993.

Pope, M., Fukushima, M., Betzel, R. F., & Sporns, O. (2021). Modular origins of high-amplitude cofluctuations in fine-scale functional connectivity dynamics. Proceedings of the National Academy of Sciences, 118(46), e2109380118.

Greenwell, S., Faskowitz, J., Pritschet, L., Santander, T., Jacobs, E. G., & Betzel, R. F. (2021). High-amplitude network co-fluctuations linked to variation in hormone concentrations over menstrual cycle. bioRxiv.

Esfahlani, F. Z., Byrge, L., Tanner, J., Sporns, O., Kennedy, D. P., & Betzel, R. F. (2021). Edge-centric analysis of time-varying functional brain networks with applications in autism spectrum disorder. bioRxiv.

