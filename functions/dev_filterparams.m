%% Function: dev_filterparams
% Author: Will Decker
% Usage: Creating your filtering parameters
% Inputs:
   % 'UI'                          -- String 'UI' opens up user interface and executes codes using the UI
   % OR
   % 'H'                           -- String 'H' followed by the value of the highpass filter (in Hz)
   % 'L'                           -- String 'L' followed by the value of the lowpass filter (in Hz)

   % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.


%%

function [params, highpass_filter, lowpass_filter] = dev_filterparams (varargin)

    % if params struc already exists
    if evalin('base', 'exist("params", "var")') == 1
        params = evalin('base', 'params');
    % if params struc does not exist
    elseif evalin('base', 'exist("params", "var")') == 0
        params = struct();
        assignin('base', 'params', params)
    end

    % if input arg is 'UI' allow user to continue executing the function
    % using the UI
    if nargin >0 && strcmp(varargin{1}, 'UI')

        uiwait(msgbox('You will be selecting your highpass and lowpass filters.'))
        
        prompt = {'Choose your highpass filter (in Hz)', 'choose your lowpass filter (in Hz).'};
        filters = inputdlg(prompt)
        
        highpass = str2double(cellstr(filters([1])));
        lowpass = str2double(cellstr(filters([2])));    
    else 
        
        % if the required 4 args are not put in display error message
        if nargin ~=4
            error(['This function requires 4 inputs. Please type in your highpass and lowpass filters each preceeded ' ...
                'with the string H and L respectively.'])
        else 
    
           highpass = double([])
           lowpass = double([])
        
           % assign corresponding values to highpass and lowpass filters
            for i = 1:2:numel(varargin)
                switch varargin{i}
                    case 'H'
                        highpass = varargin{i+1};
                    case 'L'
                        lowpass = varargin{i+1};
                end 
            end  
        end

    end

    % input highpass and lowpass filters into params structure
    params = setfield(params, 'highpass', highpass);
    params = setfield(params, 'lowpass', lowpass);
    assignin('base', 'params', params);

    % input highpass and lowpass filters into workspace
    assignin('base', 'highpass', highpass)
    assignin('base','lowpass', lowpass)

    varargout{1} = params;
    
    % output the epoch baseline and epoch end variables
    highpass_filter = params.highpass;
    lowpass_filter = params.lowpass;
