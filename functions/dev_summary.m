%% Function: dev_summary
% Author: Will Decker
% Usage: Creates a data frame summary of your analysis for ease of reporting
% Inputs:
   % none
%%

function dev_summary (subject_start, subject_end, varargin)

highpass = evalin('base', 'highpass');
lowpass = evalin('base', 'lowpass');

if nargin == 0

    disp(['Please enter summary parameters.'])

end

% filter parameters
% if strcmp(varargin{1}, 'filtparams') && nargin >= 1
% 
%     filt_statement = (['Raw data was highpass filtered at ', num2str(highpass) 'Hz and lowpass filtered at ', num2str(lowpass) 'Hz.'])
%     filters = table(highpass, lowpass);
% 
%     assignin('base', 'filt_statement', filt_statement)
%     assignin('base', 'filters', filters)
% 
% end
% filter parameters
if strcmp(varargin, 'filtparams')
    filt_statement = ['Raw data was highpass filtered at ', num2str(highpass), 'Hz and lowpass filtered at ', num2str(lowpass), 'Hz.'];
    filters = table(highpass, lowpass);
    assignin('base', 'filt_statement', filt_statement);
    assignin('base', 'filters', filters);
end

% if varargin == 'channelinterp'
% 
%     for s = subject_start : subject_end
%         subject = subjects{s};
% 
%        [ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
%         eeglab('redraw');
%     
%         EEG = pop_loadset([subject '_filter_reref_timedelete_interp'], workdir);
% 
%         rejchans1 = EEG.etc.clean_channel_mask;
% 
%         rejchans2{s} = {EEG.chanlocs(rejchans1).labels};
% 
%         rejchans = table(rejchans2)
% 
%     end
% 
% end
% 
% 
% 




