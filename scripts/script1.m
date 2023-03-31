% DevERP Simplified
% Authors: Will Decker and Julie M. Schneider
%% Welcome Message

% Hello and welcome to DevERP Simplified. 
% 
% The aim of this project is to develop and dispense a standard pipeline 
% for analyzing developmental EEG data for ERPs while concurrently providing an easily readible framework 
% for researchers to conduct ERP and EEG analysis regardless of prior coding abilities.

%% Overview

% Step 1: Establish directories
% Step 2: Establish subject list
% Step 3: Choosing which subjects to run
% Step 4: Establish filter parameters

%% Step 1: Establish directories

% option 1

dev_rawdir 
dev_workdir
dev_txtdir
dev_erpdir

% option 2

dev_makedirs % reccommended

% option 3

dev_makecustomdirs

%% Step 2: Establish subject list

dev_IDsubjects

%% Step 3: Choosing which subjects to run

dev_subs2run

%% Step 4: Establish filter parameters

dev_filterparams

%%
