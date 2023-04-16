%% Function: dev_IDsubjects
% Author: Will Decker
% Usage: Identifying list of subjects (i.e. filenames of subject's raw data) (must be in excel format)
% Inputs:
   % 'UI'                   -- String 'UI' opens up user interface and executes codes using the UI
   % OR
   % 'path/to/file'         -- String of the path to your subject list (Excel format)

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%
function dev_IDsubjects (varargin)

    % get params
    get_params

    if nargin > 0 && strcmp(varargin{1}, 'UI')
        % display
        display = questdlg(['Please select your subject list. Note: this file must be in Excel (.xslx) format.' ...
            'If you are ready to select your file please click OK. If you need instructions on how to set up' ...
            'your subject list as an Excel (.xslx) file, please click HELP'], 'ID Subjects','OK', 'HELP', 'Default');
        
        % navigate user to help on GitHub
        if strcmp(display, 'HELP')    
            web('https://github.com/w-decker/DevERP-Simplified.git')
        end
        % allow user to use UI to navigate to subject file
        subjectsfile = uigetfile('*.xlsx');
        [d,s,r] = xlsread(subjectsfile);
        
        subjects = r;
        numsubjects = (length(s));
        
        assignin('base', 'subjects', subjects)
        assignin('base', 'numsubjects', numsubjects)  
    else subjectsfile = varargin{1}
        if exist(subjectsfile, 'file') == 2 % allow users to type path to excel file as input 
            [d,s,r] = xlsread(subjectsfile)
            
            subjects = r;
            numsubjects = (length(s));
            
            assignin('base', 'subjects', subjects)
            assignin('base', 'numsubjects', numsubjects) 
        end
    end
