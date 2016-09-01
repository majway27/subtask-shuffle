# Subtask Shuffle - Jira Issue Imports

## This is a simple set of CSV manipulation scripts to support a large jira project import.

### Prep
* CSV Header Row Required
* Add Parent ID amd Issue ID columns per standard Atlassian doc
* The CSV library seems to handle most encodings well
* See config points for files at top of each script.

### Execution
* IssueIDNumbering.rb - 1st step, setup Issue ID column, every issuetype that is not a "Sub-task" category of of issuetype
* Subtasker.rb - 2nd step, iterates though each issue in export, if it has listed sub-tasks, those are found, their Parent ID column updated, and written out.
* NotSubtask.rb - 3rd step, dump out everything that isn't a subtask.
* Lastly, combine two output files (if you import everything at once order won't matter.  If you have to chunk the import into segements I would do subtasks last.)

## Special Thanks:
* Sitepoint Ruby CSV library article by Darko