# Additional resources

#### **Subject List**

The subject list is very important. Essentially, it is a list of the raw file names (wihout their file extensions) in an **Excel (.xlsx)** format. DevERP Simplified requires that you use this format. For the following instructions and details, please open up the example subject list located within this folder.

If you notice, there are a list of strings following this pattern.

```
for i = 1:30 % 30 used as an example
    fprintf('sub-%03d\n', i+1)
end
```
This is a simple and syntactic way of looking at how the naming scheme in the example subjectlist is structured. Importantly, the naming scheme you choose matters. The string that you use to identify your files (in this case, 'sub') will need to be inputted later. You must make sure that all of your raw data files consistently follow a naming scheme without deviations. If MATLAB encounters a file that does not match the name you gave it, MATLAB will produce an error.

Another important component to the subject list is the left most column that contains numbers in ascending order. This is the row or position that your file is in within the subject list. For example, in our example subjectlist, sub-005 is in position 5. When running the function `dev_subs2run`, the `'start'` and `'end'` parameters rely on the _position_ that your files are in _not_ by which number they are in the naming scheme. For example, if I want to run sub-011 through sub-016, I would write the function like so.
```
dev_subs2run(subjects, 'start', 8, 'end', 13)
```
Because there are missing values (perhaps becuase of bad data or participants failed to show up), your subject names jump from sub-007 to sub-011 thus disrupting the 1:1 correspondance between position and naming scheme. However, this does not matter becuase, if you notice, in the function above, we have called the correct files _based on their position in the subject list_. 


