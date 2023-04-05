%% Function: get_eeglab
% Author: Will Decker
% Usage: opens EEGLAB
% Inputs:
    % none

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.
%%

function get_eeglab(~)

    [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
    eeglab redraw
    