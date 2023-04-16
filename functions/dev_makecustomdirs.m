%% Function: dev_makecustomdirs()
% Author: Will Decker
% Usage: create directories needed for DevERP Simplified
% Inputs 
    % 'R', 'path/to/rawdir/         -- String 'R' proceeded by string path to rawdir
    % 'W', 'path/to/workdir/        -- String 'W' proceeded by string path to workdir
    % 'T', 'path/to/textdir/        -- String 'T' proceeded by string path to textdir
    % 'E', 'path/to/erpdir/         -- String 'E' proceeded by string path to erpdir
    % OR
    % 'UI'                          -- String 'UI' opens up user interface and executes codes using the UI

% See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%
function dev_makecustomdirs (varargin)

    % get params
    get_params

    % initiate UI
    if nargin >0 && strcmp(varargin{1}, 'UI')
    
        prompt = {'Please provide the paths to each of the following directories.'}
        uiwait(msgbox(prompt))
        
        dirNames = {'rawdir', 'workdir', 'textdir', 'erpdir'};
        display = inputdlg(dirNames);
        
        rawdir = char(display([1]))
        workdir = char(display([2]))
        textdir = char(display([3]))
        erpdir = char(display([4]))

        % add variables to workspace
        assignin('base', 'rawdir', rawdir)
        assignin('base', 'textdir', textdir)
        assignin('base', 'workdir', workdir)
        assignin('base', 'erpdir', erpdir)
    
    else % allow user to create custom directories in the specified paths
    
        rawdir = ''
        workdir = ''
        textdir = ''
        erpdir = ''
        
        for i = 1:2:numel(varargin) % initiate if 'UI' is not parameter; allow user for custom params
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

        % input into workspace
        assignin('base', 'rawdir', rawdir)
        assignin('base', 'textdir', textdir)
        assignin('base', 'workdir', workdir)
        assignin('base', 'erpdir', erpdir)
    
    end



