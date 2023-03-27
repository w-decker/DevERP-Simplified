# Functions

#### **devERP()**

This function requires no inputs. It calls the welcome message and links you to the documentation for DevERP Simplified. To execute this function simply type the following:

* `devERP` This opens up a welcome message and allows one the option to navigate to DevERP Simplified documentation on GitHub.

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

The function `dev_makecustomdirs` requires many _optional_ inputs.

1. `'UI'` Calls the UI to aid in assigning custom directories. When the UI is opened, you will be prompted to type in the paths to each directory.

If you do not wish to operate with the user interface, you may simple type each path corresponding to each directory directly within the function. 

2. `'R'` To identify your **rawdir** type the letter string 'R' and then proceeded by the string path to your file.
3. `'W'` To identify your **workdir** type the letter string 'W' and then proceeded by the string path to your file.
4. `'T'` To identify your **textdir** type the letter string 'T' and then proceeded by the string path to your file.
5. `'E'` To identify your **erpdir** type the letter string 'E' and then proceeded by the string path to your file.

Here are two examples of implementing this function.

* `dev_makecustomdirs('UI')` This calls the UI.
* `dev_makecustomdirs('R', 'path/to/file', 'W', 'path/to/file', 'T', 'path/to/file', 'E', 'path/to/file')` This automatically populates the files that you wish to correspond to the requisite directories into MATLAB without needing the UI. 

#### **dev_IDsubjects()**

The function `dev_IDsubjects` requires no inputs. Rather, it opens a UI to navigate you to your subjects list. Please see the **additional resources** folder for more information on how to format your subject list. Additional options to directly put in the pathway to your subject list file are forthcoming. 

#### **dev_subs2run()**

The function `dev_subs2run` identifies which subject files to analyze and requires _one mandatory input and other optional inputs_.

1. `subjects` this variable **must** be included as one of the functions inputs. It must be typed exactly as written here. This allows the function to directly access your subject list. 

2. `'UI'` Calls the UI to aid in choosing which subjects to run. When the UI is opened, you will be prompted with instructions on how to choose your subjects/files.

If you do not wish to operate with the user interface, do not include 'UI' as an input when calling the function.

As mentioned above, there are other optional inputs--but later segments of the code will not run unless you include these. They are optional in the sense that the function will not give you an error if they are not included.

3. `'start', file#_to_start_with`
4. `'end', file#_to_end_with`

The the value proceeding 'start' and 'end' must be the number/position that the file located at within your subjects list

Below are two examples of implementing this function.

* `dev_subs2run(subjects, 'UI')` This calls the UI.
* `dev_subs2run(subjects, 'start', 1, 'end', 15)` This tells that analysis pipeline to only run files 1 though 15.

Additional details and information necessary to understanding this function are also located in **additional resources** folder.

#### **dev_filterparams()**

The function `dev_filterparams()` allows users to select their lowpass and highpass filters. This function takes _multiple_ inputs. 

1. `'UI'` Calls the UI to aid in choosing your highpass and lowpass filters. When the UI is opened, you will be prompted with instructions on how to choose your filters.
2. `'H', 0.1` To identify your highpass filter, type the letter string 'H' followed by the value of your filter (in Hz). 0.1Hz is just an example.
3. `'L', 30` To idenfity your lowpass filter, type the letter string 'L' followed by the value of your filter (in Hz). 30Hz is just an example.

Below are two exapmles of implementing this function.

* `dev_filterparams('UI')` This calls the UI.
* `dev_filterparams('L', 30, 'H', 0.1)` This tells your analysis pipeline that your lowpass filter is 30Hz and your highpass filter is 0.1Hz.