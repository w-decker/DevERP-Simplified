%% Function: dev_txtdir()
% Author: Will Decker
% Usage: select text directory
% Inputs 
    % none

%%
function dev_txtdir(~)

uiwait(msgbox('Select the folder with your text data and output. This will serve as your text directory','modal'));

txtdir = uigetdir;

if txtdir == 0

    disp('Please select the folder for your text directory')

else

    disp(['You have selected ', txtdir, ' as your text directory'])

end

assignin('base', 'txtdir', txtdir);