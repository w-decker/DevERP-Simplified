%% Function: get_params
% Author: Will Decker
% Usage: estblishes params structure
% Inputs:
    % none

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%

function get_params(~)

    % if params struc already exists
    if evalin('base', 'exist("params", "var")') == 1
        params = evalin('base', 'params');
    % if params struc does not exist
    elseif evalin('base', 'exist("params", "var")') == 0
        params = struct()
        assignin('base', 'params', params)
    end