%% Function: devERP()
% Author: Will Decker
% Usage: Display DevERP Simplified overview
% Inputs 
    % none
%% 
function [params] = devERP(~)
    
    % create params structure
    params = struct()
    assignin('base', 'params', params)
    
    % display UI
    display = questdlg(['Hello! Thank you for using DevERP Simplified. ' ...
        'Please visit the GitHub repository to learn more about implementing DevERP Simplified. ' ...
        'If you are ready to begin, please click READY. ' ...
        'If you are not ready to begin, please click NOTREADY ' ...
        'and you will be directed to further instructions on how to start using DevERP Simplified.'], ...
        'Welcome Message', 'READY', 'NOTREADY', 'DEFAULT');
    % if NOTREAD is selected, allow user to go to GitHub help page
    if strcmp(display, 'NOTREADY')    
    msg = questdlg(['You have selected NOTREADY.' ...
        'Would you like to be redirected to DevERP Simplified instructions located on GitHub? ' ...
        'Press YES if you would like go to GitHub. ' ...
        'Press NO if you wish to remain in MATLAB.'] ...
      ,'Resources', 'YES', 'NO', 'DEFAULT')
    
        if strcmp(msg, 'YES')
    
            web('https://github.com/w-decker/DevERP-Simplified.git');
        end    
    end
