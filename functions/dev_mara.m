%% Function: dev_mara
% Author: Will Decker
% Usage: Using MARA to identify and remove artifacts
% Inputs:
   % threshold                      -- Value of probability threshold to use whe processing MARA (0.00 - 1.00)
   % 'false'                        -- DO NOT evaluate ONLY the first 10 components marked via MARA
   % 'true'                         -- Evalute ONLY the first 10 components marked via MARA

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%

function [params, EEG, com] = dev_mara(threshold, varargin)

    % load in params structure
    params = evalin('base', 'params'); % call params structure
    EEG = [];
    com = ' ';

    if evalin('base', 'exist("subjects", "var")')
        subjects = evalin('base', 'subjects')
    elseif evalin('base', '~exist("subjects", "var")')
        error(['Please make sure your subject list, subject_start and subjec_end are correctly loaded'])
    end
    
    if nargin > 0 && strcmp(varargin, 'false') % evaluate ALL components
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
    elseif nargin > 0 && strcmp(varargin, 'true') % evaluate only first 10 components
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
    
    % input highpass and lowpass filters into params structure
    params = setfield(params, 'threshold', threshold);
    params = setfield(params, 'artifacts_removes', remove_components);
    assignin('base', 'params', params);

    % input highpass and lowpass filters into workspace
    assignin('base', 'threshold', threshold);
    assignin('base','artifacts_removes', remove_components);

