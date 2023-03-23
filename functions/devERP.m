%% Function: devERP()
% Author: Will Decker
% Usage: Display DevERP Simplified overview
% Inputs 
    % none
%% 
function devERP(~)

display = questdlg(['Hello! Thank you for using DevERP Simplified. ' ...
    'Please visit the GitHub repository to learn more about implementing DevERP Simplified. ' ...
    'If you are ready to begin, please click READY. ' ...
    'If you are not ready to begin, please click NOTREADY ' ...
    'and you will be directed to further instructions on how to start using DevERP Simplified.'], ...
    'Welcome Message', 'READY', 'NOTREADY', 'DEFAULT');

display

%%

if strcmp(display, 'NOTREADY')

msg = questdlg(['A link to DevERP Simplified GitHub will display momentarily. Please click OK to continue'] ...
  ,'Resources', 'OK', 'DEFAULT')

    if strcmp(msg, 'OK')

    fig = uifigure;
    hlink = uihyperlink(fig);
    hlink.Position = [200 200 200 200];
    hlink.Text = 'DevERP';
    hlink.URL = 'https://github.com/w-decker/DevERP-Simplified.git';

    end

end
