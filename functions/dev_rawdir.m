%% Function: dev_rawdir()
% Author: Will Decker
% Usage: select raw directory
% Inputs 
    % none

    % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%
function dev_rawdir(~)


    % display message box
    uiwait(msgbox('Select the folder with your raw data. This will serve as your raw directory','modal'));
    
    rawdir = uigetdir; % initialize UI to navigate to rawdir
    
    if rawdir == 0  
        error('Please select the folder with your raw data')    
    else    
        disp(['You have selected ', rawdir, ' as your raw directory'])
    end
    
    assignin('base', 'rawdir', rawdir); % assign rawdir to workspace