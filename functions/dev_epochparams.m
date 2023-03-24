%% Function: dev_epochparams
% Author: Will Decker
% Usage: Creating your epoching parameters
% Inputs:
   % epoch baseline (in ms)
   % epoch end (in ms)
   % (optional) If you wish to interact with the UI to enter in your epoch parameters, type 'UI' as the
   % function input only.
   % Example: dev_epochparams('UI') OR dev_epochparams(-200.00, 800.00)

%%
function dev_epochparams (varargin)

if nargin > 0 && strcmp(varargin{1}, 'UI')

    uiwait(msgbox('You will be selecting your epoch baseline and epoch end.'))
    
    prompt = {'Choose your epoch baseline', 'choose your epoch end.'};
    epochs = inputdlg(prompt)
    
    epoch_baseline = str2double(cellstr(epochs([1])));
    epoch_end = str2double(cellstr(epochs([2])));
    
    assignin('base', 'epoch_baseline', epoch_baseline)
    assignin('base', 'epoch_end', epoch_end)

else

    disp(['Please type your epoch baseline (in ms) and epoch end (in ms) or type UI to allow DevERP simplified' ...
    'to walk you through choosing your epoch baseline and epoch end.'])

    epoch_baseline = varargin{1}
    epoch_end = varargin{2}

    assignin('base', 'epoch_baseline', epoch_baseline)
    assignin('base', 'epoch_end', epoch_end)

end

