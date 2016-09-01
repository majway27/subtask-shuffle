#!/usr/bin/env ruby
require 'csv'
#Open Files
target = CSV.open('subtasks.csv', 'wb')
source = CSV.read('full.csv', 'rb', headers:true)
source2 = CSV.read('full.csv', 'rb', headers:true)
# Process rows sequentially, For each row
source.select do |row|
  ## If Subtask field not null
  if row['Sub-Tasks'] != nil # Should filter all Subtask issue types as well.
    ### Grab STIssueKeys, For each STIssueKey in STIssueKeys
    #puts "Row: #{row['Key']} has Subtasks: #{row['Sub-Tasks']}" # Debug Sub-tasks filter
    subtasks = row['Sub-Tasks'].split(", ")
    subtasks.each do |subtaskkey| 
      source2.select do |strow|
        ### Go find matching row in source2
        if strow['Key'].to_s == subtaskkey.to_s
          ### set Parent ID to subtaskkey
          strow['Parent ID'] = row['Issue ID']
          ### write row to output
          target << strow
          #puts strow
        end # End if
      end # end select
    end # End Each
    #puts "Next!"
    # Note - 
    # 1. This script just collects subtasks with Parent pointers out in a file.
    # 2. After script completes will need to pull out all non-subtasks in separate file.
    # 3. Then cat subtasks on end of main list of non-subtasks.  That way we load subtasks and parents exist in jira.
  end #end if
end # end select

