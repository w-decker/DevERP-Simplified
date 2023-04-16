%% Function: dev_txtdir()
% Author: Will Decker
% Usage: select text directory
% Inputs 
    % none

    % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.


%%
function dev_txtdir(~)

    % get params
    get_params

    % display message box
    uiwait(msgbox('Select the folder with your text data and output. This will serve as your text directory','modal'));
    txtdir = uigetdir; % initialize UI to navigate to textdir
    
    if txtdir == 0    
        error('Please select the folder for your text directory')    
    else   
        disp(['You have selected ', txtdir, ' as your text directory'])
    end
    
    assignin('base', 'txtdir', txtdir);% assign textdir to workspace