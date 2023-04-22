%% Function: dev_filter
% Author: Will Decker
% Usage: Filter your data based on your highpass and lowpass filter
% Inputs:
    % none

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

function [ALLEEG, EEG, CURRENTSET, ALLCOM] = dev_filter(~)

  % load in subject to run
    if evalin('base', 'exist("subjects", "var")') == 1
        subjects = evalin('base', 'subjects');
    else
        error('Variable ''subjects'' not found in the workspace.');
    end

    % load working directory
    if evalin('base', 'exist("workdir", "var")') == 1
        workdir = evalin('base', 'workdir');
    else
        error('Variable ''workdir'' not found in the workspace.');
    end

    % load subject start
    if evalin('base', 'exist("subject_start", "var")') == 1
        subject_start = evalin('base', 'subject_start');
    else
        error('Variable ''subject_start'' not found in the workspace.');
    end
    
    % load subject end
    if evalin('base', 'exist("subject_end", "var")') == 1
        subject_end = evalin('base', 'subject_end');
    else
        error('Variable ''subject_end'' not found in the workspace.');
    end

     % load filter params 
    if evalin('base', 'exist("highpass", "var")') == 1
        highpass = evalin('base', 'highpass');
    else
        error('Variable ''highpass'' not found in the workspace.');
    end

    if evalin('base', 'exist("lowpass", "var")') == 1
        lowpass = evalin('base', 'lowpass');
    else
        error('Variable ''lowpass'' not found in the workspace.');
    end

    % load in EEG structs
    ALLEEG = evalin('caller', 'ALLEEG');
    EEG = evalin('caller', 'EEG');
    CURRENTSET = evalin('caller', 'CURRENTSET');
    ALLCOM = evalin('caller', 'ALLCOM');


       for s = subject_start:subject_end
       subject = subjects{s};

            EEG = pop_eegfilt ( EEG, highpass, lowpass, [], [0], 0, 0, 'fir1', 0);
            [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'setname',[subject '_filt'],'gui','off'); % If you wish to change the naming scheme, replace '_fl'
            EEG = eeg_checkset( EEG );
        
            EEG = pop_saveset( EEG, [workdir filesep subject '_filt']);
       end

% Output variables to workspace
assignin('caller', 'ALLEEG', ALLEEG);
assignin('caller', 'EEG', EEG);
assignin('caller', 'CURRENTSET', CURRENTSET);
assignin('caller', 'ALLCOM', ALLCOM);