%% Function: dev_workdir()
% Author: Will Decker
% Usage: select working directory
% Inputs 
    % none

    % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%
function dev_workdir(~)

    % get params
    get_params
    
    % display message box
    uiwait(msgbox('Select the folder for your working data analysis. This will serve as your working directory','modal'));
    
    workdir = uigetdir; % initialize UI to navigate to workdir
    
    if workdir == 0   
        error('Please select the folder for your working directory')    
    else    
        disp(['You have selected ', workdir, ' as your working directory'])   
    end
    
    assignin('base', 'workdir', workdir); % assign workdir to workspace