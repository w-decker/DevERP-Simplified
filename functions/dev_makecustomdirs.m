%% Function: dev_makecustomdirs()
% Author: Will Decker
% Usage: create directories needed for DevERP Simplified
% Inputs 
    % none

%%
function dev_makecustomdirs (varargin)

if nargin >0 && strcmp(varargin{1}, 'UI')

    prompt = {'Please provide the paths to each of the following directories.'}
    uiwait(msgbox(prompt))
    
    dirNames = {'rawdir', 'workdir', 'textdir', 'erpdir'};
    display = inputdlg(dirNames);
    
    rawdir = char(display([1]))
    workdir = char(display([2]))
    textdir = char(display([3]))
    erpdir = char(display([4]))

else 

    rawdir = ''
    workdir = ''
    textdir = ''
    erpdir = ''
    
    for i = 1:2:numel(varargin)
        switch varargin{i}
            case 'R'
                rawdir = varargin{i+1};
            case 'W'
                workdir = varargin{i+1};
            case 'T'
                textdir = varargin{i+1};
            case 'E'
                erpdir = varargin{i+1};
        end
    end
    
    assignin('base', 'rawdir', rawdir)
    assignin('base', 'textdir', textdir)
    assignin('base', 'workdir', workdir)
    assignin('base', 'erpdir', erpdir)

end



