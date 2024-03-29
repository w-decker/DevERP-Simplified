%% Function: dev_epochparams
% Author: Will Decker
% Usage: Creating your epoching parameters
% Inputs:
   % 'UI'                          -- String 'UI' opens up user interface and executes codes using the UI
   % OR
   % 'baseline'                    -- String 'baseline' followed by the value of the epoch baseline (in ms)
   % 'end'                         -- String 'end' followed by the value of the epoch end (in ms)

  % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.


%%
function [params, epoch_baseline, epoch_end] = dev_epochparams (varargin)

    % if params struc already exists
    if evalin('base', 'exist("params", "var")') == 1
        params = evalin('base', 'params');
    % if params struc does not exist
    elseif evalin('base', 'exist("params", "var")') == 0
        params = struct();
        assignin('base', 'params', params)
    end

    if nargin > 0 && strcmp(varargin{1}, 'UI') % if 'UI' is parameter, execute code through UI
        uiwait(msgbox('You will be selecting your epoch baseline and epoch end.'))
        
        prompt = {'Choose your epoch baseline', 'choose your epoch end.'};
        epochs = inputdlg(prompt);
        
        epoch_baseline = str2double(cellstr(epochs([1])));
        epoch_end = str2double(cellstr(epochs([2])));
        
        assignin('base', 'epoch_baseline', epoch_baseline)
        assignin('base', 'epoch_end', epoch_end)
    
    else % allow user to input custom values as epoch baseline and end
        epoch_baseline = double([]);
        epoch_end = double([]);
    
        for i = 1:2:numel(varargin)
            switch varargin{i}
                case 'baseline'
                    epoch_baseline = varargin{i+1};
                case 'end'
                    epoch_end = varargin {i+1};
            end
        end
    
        disp(['Your epoch baseline is ', num2str(epoch_baseline), 'ms and your epoch end is ', num2str(epoch_end), 'ms.'])
    
        assignin('base', 'epoch_baseline', epoch_baseline)
        assignin('base', 'epoch_end', epoch_end)
    
    end

    % input highpass and lowpass filters into params structure
    params = setfield(params, 'epoch_baseline', epoch_baseline);
    params = setfield(params, 'epoch_end', epoch_end);
    assignin('base', 'params', params);

    varargout{1} = params;
    
    % output the epoch baseline and epoch end variables
    epoch_baseline = params.epoch_baseline;
    epoch_end = params.epoch_end;