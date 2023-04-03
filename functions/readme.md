# Functions

#### **devERP()**

This function requires no inputs. It calls the welcome message and links you to the documentation for DevERP Simplified. To execute this function simply type the following:

* `devERP` This opens up a welcome message and allows one the option to navigate to DevERP Simplified documentation on GitHub.

#### **devHELP()**

This function requires no inputs. It calls a HELP message and directs you to the documentation shown here. To execute this function simply type the following.

* `devHELP`

#### **dev_rawdir()**

The function `dev_rawdir` does not take any inputs. Rather, when called, it prompts a UI to aid in navigating to a folder that will serve as your raw directory--the folder that will house your raw EEG data files.

#### **dev_workdir()**

The function `dev_workdir` does not take any inputs. Rather, when called, it prompts a UI to aid in navigating to a folder that will serve as your working directory--the folder that will house your working data files that have been analyzed.

#### **dev_txtdir()**

The function `dev_txtdir` does not take any inputs. Rather, when called, it prompts a UI to aid in navigating to a folder that will serve as your text directory--the folder that will house your textual data files.

#### **dev_erpdir()**

The function `dev_erpdir` does not take any inputs. Rather, when called, it prompts a UI to aid in navigating to a folder that will serve as your ERP directory--the folder that will house your ERP data files.

#### **dev_makedirs()**

The function `dev_makedirs` does not take any inputs. Rather, it automatically creates the necessary directories (rawdir, workdir, textdir, erpdir) directly in MATLAB's current working directory (`pwd`). All you must do once this function has been executed is add your raw EEG data into the rawdir.

#### **dev_makecustomdirs()**

The function `dev_makecustomdirs` requires many _multiple_ inputs.

1. `'UI'` Calls the UI to aid in assigning custom directories. When the UI is opened, you will be prompted to type in the paths to each directory.

If you do not wish to operate with the user interface, ignore the previous parameter and read below.

2. `'R'` To identify your **rawdir** type the letter string 'R' and then proceeded by the string path to your file.
3. `'W'` To identify your **workdir** type the letter string 'W' and then proceeded by the string path to your file.
4. `'T'` To identify your **textdir** type the letter string 'T' and then proceeded by the string path to your file.
5. `'E'` To identify your **erpdir** type the letter string 'E' and then proceeded by the string path to your file.

Here are two examples of implementing this function.

```
dev_makecustomdirs('UI') % This calls the UI.

dev_makecustomdirs('R', 'path/to/file', 'W', 'path/to/file', 'T', 'path/to/file', 'E', 'path/to/file') % This automatically populates the files that you wish to correspond to the requisite directories into MATLAB without needing the UI. 
```

#### **dev_IDsubjects()**

The function `dev_IDsubjects` allows users to identify the file which lists the subject/names of data files to be run through the analysis. This requires _multiple_ inputs.

1. `'UI'` Calls the UI to aid in choosing your subject list file. When the UI is opened, you will be prompted with instructions on how to choose your subjects/files.

If you do not wish to operate with the user interface, ignore the previous parameter and read below.

2. `'path/to/file/` The string path to your subject list.

Below are two examples of implementing this function.

```
dev_IDsubjects('UI') % This calls the UI.

dev_IDsubjccts('path/to/file/') % This tells the code the exact location of your subject list and will load this into MATLAB.
```

Please see the **additional resources** folder for more information what a subject list is and how to format your subject list.

#### **dev_subs2run()**

The function `dev_subs2run` identifies which subject files to analyze and requires _multiple_ inputs.

1. `'UI'` Calls the UI to aid in choosing which subjects to run. When the UI is opened, you will be prompted with instructions on how to choose your subjects/files.

If you do not wish to operate with the user interface, ignore the previous parameter and read below.

2. `'start', file#_to_start_with` Which files to begin with
3. `'end', file#_to_end_with` Which files to end with

The the value proceeding 'start' and 'end' must be the number/position that the file located at within your subjects list

Below are two examples of implementing this function.

```
dev_subs2run('UI') % This calls the UI.

dev_subs2run('start', 1, 'end', 15) % This tells that analysis pipeline to only run files 1 though 15.
```

Additional details and information necessary to understanding this function are also located in **additional resources** folder.

#### **dev_filterparams()**

The function `dev_filterparams()` allows users to select their lowpass and highpass filters. This function takes _multiple_ inputs. 

1. `'UI'` Calls the UI to aid in choosing your highpass and lowpass filters. When the UI is opened, you will be prompted with instructions on how to choose your filters.
2. `'H', 0.1` To identify your highpass filter, type the letter string 'H' followed by the value of your filter (in Hz). 0.1Hz is just an example.
3. `'L', 30` To idenfity your lowpass filter, type the letter string 'L' followed by the value of your filter (in Hz). 30Hz is just an example.

Below are two exapmles of implementing this function.

```
dev_filterparams('UI') % This calls the UI.

dev_filterparams('L', 30, 'H', 0.1) % This tells your analysis pipeline that your lowpass filter is 30Hz and your highpass filter is 0.1Hz.
```

#### **dev_epochparams()**

The function `dev_epochparams` allows users to select the timeframe in which they wish to epoch their data. This function takes _multiple_ inputs.

1. `'UI'` Calls the UI to ain in choosing your epoch baseline and epoch end. When the UI is openend, you will be prompted to select your epoching parameters.
2. `'baseline', -500'` To idenfity your epoch baseline, type the string 'baseline' followed by the value of your baseline. -500ms is just an example.
2. `'end', 1000` To identify your epoch end, type the string 'end' followed by the value of your end. 1000ms is just an example. 

Below are two examples of implementing this function. 

```
dev_epochparams('UI') % This calls the UI.

dev_epochparams('baseline', -300, 'end', 500) % This tells your analysis pipeline that your epoch baseline is -300ms and your epoch end is 500ms.
```

#### **dev_mara()**

The function `dev_mara` allows users to identify and remove components using MARA, an EEGLAB plugin. Details for MARA can be found [here](https://irenne.github.io/artifacts/). 

This function requires _multiple_ inputs.

1. `'UI'` Calls the UI to ain in choosing your threshold. When the UI is openend, you will be prompted to select your threshold and whether you wish to evaluate ALL components or just the first 10.
2. `'threshold', 0.6` The probability threshold to use when processing mara. (0.00 - 1.00). MARA marks each components with a probabililty value, which tells one the likelihood that the component is a true artifact. To standardize the process, DevERP Simplified has you define a threshold in which the function we've create removes every component that is >= the user defined threshold. To idenfity your threshold, type the string 'threshold' followed by the value of your baseline. 0.6 is just an example.
3. `'ALL'` If you wish to evaluate ALL components, type the string 'false'. This function defaults to evaluation the first 10 components ONLY.
4. `'TEN'` If you wish to evaluate the first 10 components ONLY, type the string 'true'.

Below are three examples for implementing this function.

```
dev_mara('UI') % This opens the UI

dev_mara('threshold', 0.6, 'ALL') % remove ALL components that are 0.60 liklely or higher to be an artifact.

dev_mara('threshold', 0.6, 'TEN') % remove artifacts within the first 10 marked components ONLY that are 0.60 likely or higher to be an artifact.
```