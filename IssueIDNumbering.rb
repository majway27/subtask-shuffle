#!/usr/bin/env ruby
require 'csv'

# Open Files
target = CSV.open('full-numbered.csv', 'wb')
source = CSV.read('full.csv', 'rb', headers:true)
# n=1
n=1
# Read row
source.select do |row|
# If Issuetype != Sub-task || Issuetype !=Null
  if row['Issue Type'].to_s != 'Sub-task'
    ### set Issue ID to n
    row['Issue ID'] = n
    ### n +=1
    n +=1
    ### write row to output
    target << row
  ## Else
  else
    ### write row to output
    target << row
    #puts row['Issue Type']
  end
# End
end