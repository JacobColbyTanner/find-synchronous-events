


num_subjects = 25;
scans = 1;
numtime = 900;
p_threshold = 0.05;



outputs_movies = open_movie_data(num_subjects,numtime,scans);





%select null model  (Rest or Circshift)
%Rest null model
outputs_rest = open_rest_data(num_subjects,numtime,scans);
[synchronous_events,p_values] = run_rest_null_model(outputs_movies, outputs_rest, num_subjects, scans, p_threshold);

%or
%Circshift null model (doesn't require resting state scans and is less
%conservative than the resting-state null model)
%[synchronous_events,p_values] = run_circshift_null_model(outputs_movies, num_subjects, scans, p_threshold)


