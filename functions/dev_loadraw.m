%% Function: dev_loadraw
% Author: Will Decker
% Usage: Importing and loading raw files of different formats (e.g., BrainVision, BioSemi, etc.)
% Inputs:
    % 'bv'                      -- String 'bv' loads brain vision files that correspond to your subject_start and subject_end

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

function [ALLEEG, EEG, CURRENTSET, ALLCOM] = dev_loadraw(varargin)

    % load in subject to run
    if evalin('base', 'exist("subjects", "var")') == 1
        subjects = evalin('base', 'subjects');
    else
        error('Variable ''subjects'' not found in the workspace.');
    end

    % load raw directory
    if evalin('base', 'exist("rawdir", "var")') == 1
        rawdir = evalin('base', 'rawdir');
    else
        error('Variable ''rawdir'' not found in the workspace.');
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


    % load EEGLAB
    [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
    eeglab('redraw');

    % Load in BrainVision files
    if nargin > 0 && strcmp(varargin{1}, 'bv')

        for s = subject_start:subject_end
            subject = subjects{s};
           
            % use EEGLAB to load
            EEG = pop_loadbv (rawdir, [subject '.vhdr'], [], []);
            [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname',subject,'gui','off'); 
            EEG = eeg_checkset( EEG );
        end
    end

% Output variables to workspace
assignin('caller', 'ALLEEG', ALLEEG);
assignin('caller', 'EEG', EEG);
assignin('caller', 'CURRENTSET', CURRENTSET);
assignin('caller', 'ALLCOM', ALLCOM);
