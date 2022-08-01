function [synchronous_events,p_values] = run_rest_null_model(outputs_movies, outputs_rest, num_subjects, scans, p_threshold)

%Add path to functions
addpath("\functions")


%get resting state events
for scan = 1:scans
    all = [];
    for sub = 1:num_subjects
        
        all = [all; outputs_rest{sub,scan}.sig(:,1)'];
        
        
    end
    
    events_kenn{scan} = all;
end





%get movie watching events
for scan = 1:scans
    all = [];
    for sub = 1:1:num_subjects
        sigg = outputs_movies{sub,scan}.sig(:,1)';
        all = [all; sigg];
        
        
    end
    
    events_movie_kenn{scan} = all;
end






synchronous_events = {};

for scan = 1:scans

    %HCP
    event_null = [];

        
        
    event_null = sum(events_kenn{scan}(:,1:size(events_movie_kenn{scan},2)));
        
    
    
    nsubj = num_subjects;
    
    hh = hist(event_null(:),0:nsubj)/numel(event_null);
    
    
    select_real = [sum(events_movie_kenn{scan})]+1;
    
    
    p_values = hh(select_real);
    
    
    [padj] = fcn_linear_step_up(p_values,p_threshold)
    
    
    synchronous_events{scan} = p_values <= padj;

    
    
end


