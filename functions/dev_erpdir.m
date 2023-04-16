%% Function: dev_erpdir()
% Author: Will Decker
% Usage: select ERP directory
% Inputs 
    % none

    % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.


%%
function dev_erpdir(~)

    % get params
    get_params

    % display message box
    uiwait(msgbox('Select the folder with your ERP data and output. This will serve as your ERP directory','modal'));
    erpdir = uigetdir; % initialize UI to navigate to erpdir
    
    if erpdir == 0
        error('Please select the folder for your ERP directory')
    else
        disp(['You have selected ', erpdir, ' as your ERP directory'])
    end
    
    assignin('base', 'erpdir', erpdir); % assign textdir to workspace