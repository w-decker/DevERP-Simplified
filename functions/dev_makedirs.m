%% Function: dev_makdirs()
% Author: Will Decker
% Usage: create directories needed for DevERP Simplified
% Inputs 
    % none

%%
function dev_makedirs(~)

dirNames = {'rawdir', 'workdir', 'textdir', 'erpdir'};

for i = 1:length(dirNames)

    dirPath = fullfile(pwd, dirNames{i});
    mkdir(dirPath);
    assignin('base', dirNames{i}, dirPath);

end

disp(['Directories have been successfully created in' num2str(pwd) '.']);
disp(['Please add your raw EEG data into you raw directory.']);