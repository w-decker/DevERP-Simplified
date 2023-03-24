%% Function: dev_filterparams
% Author: Will Decker
% Usage: Creating your filtering parameters
% Inputs:
   % Filter type ('H' = highpass, 'L' = lowpass)
   % highpass filter value (in Hz) (must be preceeded by 'H'
   % lowpass filter value (in Hz) (must be preceeded by 'L'
   % (optional) If you wish to interact with the UI to enter in your filter parameters, type 'UI' as the
   % function input only.
   % Example: dev_filterparams('UI') OR dev_filterparams('H', 30, 'L', 0.1)

%%

function dev_filterparams (varargin)

if nargin == strcmp(varargin{1}, 'UI')

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

    filtertype1 = varargin{1};
    value1 = varargin{2};
    filtertype2 = varargin{3};
    value2 = varargin{4};
    
    if filtertype1 == 'H'

        highpass = value1;

    elseif filtertype1 == 'L'

        lowpass = value1;

    end

    if filtertype2 == 'H'

        highpass = value2;

    elseif filtertype2 == 'L'

        lowpass = value2;

    end

assignin('base', 'highpass', highpass)
assignin('base', 'lowpass', lowpass)    

end

