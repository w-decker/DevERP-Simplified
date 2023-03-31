%% Function: dev_makdirs()
% Author: Will Decker
% Usage: create directories needed for DevERP Simplified
% Inputs 
    % none

    % See https://github.com/w-decker/DevERP-Simplified/tree/main/functions or type devHELP in the command window.

%%
function dev_makedirs(~)

    dirNames = {'rawdir', 'workdir', 'textdir', 'erpdir'}; % establish directory names
    
    % create directories in the current pwd
    for i = 1:length(dirNames)
        dirPath = fullfile(pwd, dirNames{i});
        mkdir(dirPath);
        assignin('base', dirNames{i}, dirPath);
    end

    % display path to dir
    disp(['Directories have been successfully created in' num2str(pwd) '.']);
    disp(['Please add your raw EEG data into you raw directory.']);