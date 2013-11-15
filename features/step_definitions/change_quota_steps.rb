
Given /^the following usages exist:$/ do |table|
	table.hashes.each do |usage|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	#puts movie
  	  new_usage = Usage.create!(usage)
        end
end

Given /I am logged in as "(.*)"/ do |name|
	#always logged in as aculich for now
end
