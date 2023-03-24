%% Function: dev_IDsubjects
% Author: Will Decker
% Usage: Identifying list of subjects (i.e. filenames of subject's raw data)
% Inputs:
   % none

%%
function dev_IDsubjects (~)

display = questdlg(['Please select your subject list. Note: this file must be in Excel (.xslx) format.' ...
    'If you are ready to select your file please click OK. If you need instructions on how to set up' ...
    'your subject list as an Excel (.xslx) file, please click HELP'], 'ID Subjects','OK', 'HELP', 'Default');

if strcmp(display, 'HELP')

    web('https://github.com/w-decker/DevERP-Simplified.git')

end

subjectsfile = uigetfile('*.xlsx');
[d,s,r] = xlsread(subjectsfile);

subjects = r;
numsubjects = (length(s));

assignin('base', 'subjects', subjects)
assignin('base', 'numsubjects', numsubjects)