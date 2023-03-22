%% Function: dev_rawdir()
% Author: Will Decker
% Usage: select raw directory
% Inputs 
    % none

%%
function dev_rawdir(~)

uiwait(msgbox('Select the folder with your raw data. This will serve as your raw directory','modal'));

rawdir = uigetdir;

if rawdir == 0

    disp('Please select the folder with your raw data')

else

    disp(['You have selected ', rawdir, ' as your raw directory'])

end

assignin('base', 'rawdir', rawdir);