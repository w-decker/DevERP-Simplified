%% Function: dev_subs2run
% Author: Will Decker
% Usage: Identifying which specific subject's files to analyze
% Inputs: 
    % subject list variable ('subjects')
    % (optional)If you wish to interact with the UI to enter in your subjects, type 'UI' as the
    % function input after your subject list variable.
    % Example: dev_subs2run(subjects, 'UI') OR dev_subs2run(subjects, 1, 5)

%%
function dev_subs2run (subjects, varargin)

if naragin > 0 && strcmp(varargin{1}, 'UI')

    uiwait(msgbox(['You will be selecting which files to process through DevERP Simplified. ' ...
        'This is done by choosing the first file you wish to analyze and then the last file you wish to analyze.' ...
        'You will input those files position in the [subjects] variable in your workspace.' ...
        'For example, if you wish to run subjects 1 through 10, you will navigate to the [subjects] cell in your workspace' ...
        'and choose the position that sub-001 is located in as your subject_start and the position that sub-010 is in as you subject_end.' ...
        'The code will analyze all the files from sub-001 through sub 010.'], 'modal'))
    
    prompt = {'Choose the position of the file that you wish to begin analyzing.', ['Choose the last file that you wish to analyze. If you' ...
        'only wish to run 1 file, please type the same number twice.']}
    subs2run = inputdlg(prompt)
    
    subject_start = str2double(cellstr(subs2run([1])));
    subject_end = str2double(cellstr(subs2run([2])));
    
    assignin('base', 'subject_start', subject_start)
    assignin('base', 'subject_end', subject_end)
    
    disp(['You have selected to analyze subjects', string(subjects([subject_start])), 'through', string(subjects([subject_end])), '.']);

else 

    subject_start = varargin{1}
    subject_end = varargin{2}

    assignin('base', 'subject_start', subject_start)
    assignin('base', 'subject_end', subject_end)

end
    