%% Function: get_subs2run
% Author: Will Decker
% Usage: Pulls subject list, subject start and subject end into dev function
% Inputs:
    % none

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%

function get_subs2run(~)

    % load in subject lists
    if evalin('base', 'exist("subjects", "var")')
        subjects = evalin('base', 'subjects')
    elseif evalin('base', '~exist("subjects", "var")')
        error(['Please make sure your subject list is loaded.'])
    end

    % load in subject start
    if evalin('base', 'exist("subject_start", "var")')
        subject_start = evalin('base', 'subject_start')
    elseif evalin('base', '~exist("subject_start", "var")')
        error(['Please make sure your subject_start is loaded.'])
    end
    
    % load in subject end
    if evalin('base', 'exist("subject_end", "var")')
        subject_end = evalin('base', 'subject_end')
    elseif evalin('base', '~exist("subject_end", "var")')
        error(['Please make sure your subject_end is loaded.'])
    end

