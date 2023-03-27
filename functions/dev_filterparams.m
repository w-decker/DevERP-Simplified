%% Function: dev_filterparams
% Author: Will Decker
% Usage: Creating your filtering parameters
% Inputs:
   % Filter type ('H' = highpass, 'L' = lowpass)
   % highpass filter value (in Hz) (must be preceeded by 'H'
   % lowpass filter value (in Hz) (must be preceeded by 'L'
   % (optional) If you wish to interact with the UI to enter in your filter parameters, type 'UI' as the
   % function input only.
   % Example: dev_filterparams('UI') OR dev_filterparams('H', 0.1, 'L', 30)

%%

function dev_filterparams (varargin)

if nargin >0 && strcmp(varargin{1}, 'UI')

    uiwait(msgbox('You will be selecting your highpass and lowpass filters.'))
    
    prompt = {'Choose your highpass filter (in Hz)', 'choose your lowpass filter (in Hz).'};
    filters = inputdlg(prompt)
    
    highpass = str2double(cellstr(filters([1])));
    lowpass = str2double(cellstr(filters([2])));
    
    assignin('base', 'highpass', highpass)
    assignin('base', 'lowpass', lowpass)

else 

    if nargin ~=4
        disp(['This function requires 4 inputs. Please type in your highpass and lowpass filters each preceeded' ...
            'with the string H and L respectively.'])
    end

   highpass = double([])
   lowpass = double([])

    for i = 1:2:numel(varargin)
        switch varargin{i}
            case 'H'
                highpass = varargin{i+1};
            case 'L'
                lowpass = varargin{i+1};
        end 
    end

assignin('base', 'highpass', highpass)
assignin('base', 'lowpass', lowpass)    

end

