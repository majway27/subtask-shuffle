#!/usr/bin/env ruby
require 'csv'

# Open Files
target = CSV.open('regular.csv', 'wb')
source = CSV.read('full.csv', 'rb', headers:true)
# Read row
source.select do |row|
# If Issuetype != Sub-task
  if row['Issue Type'].to_s != 'Sub-task'
    ### write row to output
    target << row
  end
# End
end