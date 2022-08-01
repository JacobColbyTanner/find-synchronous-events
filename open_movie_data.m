
function outputs = open_movie_data(num_subjects,numtime,scans)
%open movie data 


%how many scans/movies to include (number of scans in this dataset is 4)
%scans = 1

%number of time points common to all scans
%numtime = 947

%enter the number of subjects
%num_subjects= 25

% directory where data lives
datadir = 'preprocessed_BOLD_time_series\movie';

%directory for functions
addpath('functions')  


% list of all subjects data files
datalist = dir(fullfile(datadir,'*.mat'));



for j = 1:scans
    for i = 1:num_subjects
        
        % load data from subject 1 
        % the length of datalist to load in a different subject's data)
        isub = i;
        load(fullfile(datalist(isub).folder,datalist(isub).name));

        % fmri data are organized as follows:
        %   • parcel_time = cell array of [time x node] activity time series. The
        %     number of cells in the array is equal to the number of scans.
        %   • tmask_all = cell array of framewise displacement (in-scanner
        %     movement) at every time -- we use this to censor high-motion frames.



        % get number of scans
        numscans = length(parcel_time);

        % set index to scan i
        iscan = j;

        % extract time series
        ts = parcel_time{iscan};

        motion = tmask_all{j};


        % number of time points, number of nodes
        [~,numnodes] = size(ts);

        %cut time series so that they are all the same length
        ts = ts(1:numtime,:);

        outputs{i,j} = fcn_get_events(ts,100,motion);
        

    end
end





