%% Function: devHELP
% Author: Will Decker
% Usage: Navigate users to help/documentation 
% Inputs:
   % none

%%

function devHELP

    % display prompt
    display = questdlg(['If you would like to view documentation for DevERP Simplified, ' ...
        'please press HELP. If not, please press NO.'], 'Help', 'HELP', 'NO', 'Default')

    % navigate user to help/documentation
    if strcmp(display, 'HELP')
        web('https://github.com/w-decker/DevERP-Simplified/tree/main/functions')
    end
    

    
