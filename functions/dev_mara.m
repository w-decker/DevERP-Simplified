%% Function: dev_mara
% Author: Will Decker
% Usage: Using MARA to identify and remove artifacts
% Inputs:
   % 'UI'                           -- String 'UI' opens up user interface and executes codes using the UI
   % OR
   % threshold                      -- Value of probability threshold to use whe processing MARA (0.00 - 1.00)
   % 'false'                        -- DO NOT evaluate ONLY the first 10 components marked via MARA
   % 'true'                         -- Evalute ONLY the first 10 components marked via MARA

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%

function [params, EEG, com] = dev_mara(varargin)

    % load in params structure
    params = evalin('base', 'params'); % call params structure
    EEG = [];
    com = ' ';

    % access subject list, subject start and subject end
    get_subs2run
    
    % initiate UI
    if nargin > 0 && strcmp(varargin{1}, 'UI')
        display = inputdlg('Please select your probability threshold (0.00-1.00)')
        threshold = str2double(cellstr(display([1])));
        components2eval = questdlg(['Do you wish to evaluate ALL components or only the first 10? ' ...
            'Press ALL to evaluate all or TEN to only evaluate the first 10'], 'Components To Eval', 'ALL', 'TEN', 'Default')        
        if strcmp(components2eval, 'ALL')
            for s = subject_start : subject_end
                subject = subjects{s}
                % establish data objects
                [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
                eeglab('redraw');
                
                % load ICA set
                EEG = pop_loadset ([subject '_ICA.set'], workdir);
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
                
                % run MARA and identify components
                [ALLEEG, EEG, EEG.reject.gcompreject ] = processMARA (ALLEEG, EEG,CURRENTSET) ;
                
                % remove components greater than or equal to probability threshold
                remove_components = EEG.reject.MARAinfo.posterior_artefactprob >= threshold;
                EEG = pop_subcomp( EEG, find(remove_components), 0);
                [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'setname',[subject '_MARA'],'gui','off');
                EEG = eeg_checkset( EEG );
                
                % save new dataset
                EEG = eeg_checkset( EEG ) ;
                [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET ) ;
                EEG = pop_saveset( EEG, [subject '_MARA'], workdir);
            end  
        elseif strcmp(components2eval, 'TEN')
            for s = subject_start : subject_end
                subject = subjects{s};
                % establish data objects
                [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
                eeglab('redraw');
                
                % load ICA set
                EEG = pop_loadset ([subject '_ICA.set'], workdir);
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
                
                % run MARA and identify components
                [ALLEEG, EEG, EEG.reject.gcompreject ] = processMARA (ALLEEG, EEG,CURRENTSET) ;
                
                % remove components greater than or equal to probability threshold
                remove_components = EEG.reject.MARAinfo.posterior_artefactprob(1:10) >= threshold;
                EEG = pop_subcomp( EEG, find(remove_components), 0);
                [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'setname',[subject '_MARA'],'gui','off');
                EEG = eeg_checkset( EEG );
                
                % save new dataset
                EEG = eeg_checkset( EEG ) ;
                [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET ) ;
                EEG = pop_saveset( EEG, [subject '_MARA'], workdir);
            end
        end
    else

% execute code based on paramters if ~UI
        threshold = double([]);
        for i = 1:2:numel(varargin)
            switch varargin{i}
                case 'threshold'
                    threshold = varargin {i + 1};
            end
        end

        if nargin > 0 && strcmp(varargin(3), 'ALL') % evaluate ALL components
            for s = subject_start : subject_end
                subject = subjects{s};
                % establish data objects
                [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
                eeglab('redraw');
                
                % load ICA set
                EEG = pop_loadset ([subject '_ICA.set'], workdir);
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
                
                % run MARA and identify components
                [ALLEEG, EEG, EEG.reject.gcompreject ] = processMARA (ALLEEG, EEG,CURRENTSET) ;
                
                % remove components greater than or equal to probability threshold
                remove_components = EEG.reject.MARAinfo.posterior_artefactprob >= threshold;
                EEG = pop_subcomp( EEG, find(remove_components), 0);
                [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'setname',[subject '_MARA'],'gui','off');
                EEG = eeg_checkset( EEG );
                
                % save new dataset
                EEG = eeg_checkset( EEG ) ;
                [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET ) ;
                EEG = pop_saveset( EEG, [subject '_MARA'], workdir);
            end
        
        elseif nargin > 0 && strcmp(varargin(3), 'TEN') % evaluate only first 10 components
            for s = subject_start : subject_end
                subject = subjects{s};
                % establish data objects
                [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
                eeglab('redraw');
                
                % load ICA set
                EEG = pop_loadset ([subject '_ICA.set'], workdir);
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
                
                % run MARA and identify components
                [ALLEEG, EEG, EEG.reject.gcompreject ] = processMARA (ALLEEG, EEG,CURRENTSET) ;
                
                % remove components greater than or equal to probability threshold
                remove_components = EEG.reject.MARAinfo.posterior_artefactprob(1:10) >= threshold;
                EEG = pop_subcomp( EEG, find(remove_components), 0);
                [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'setname',[subject '_MARA'],'gui','off');
                EEG = eeg_checkset( EEG );
                
                % save new dataset
                EEG = eeg_checkset( EEG ) ;
                [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET ) ;
                EEG = pop_saveset( EEG, [subject '_MARA'], workdir);
            end
        end
    end
    
    % input highpass and lowpass filters into params structure
    params = setfield(params, 'threshold', threshold);
    params = setfield(params, 'artifacts_removes', remove_components);
    assignin('base', 'params', params);

    % input highpass and lowpass filters into workspace
    assignin('base', 'threshold', threshold);
    assignin('base','artifacts_removes', remove_components);

