Given /the following usages exist:$/ do |usages|
	Usage.create!(usages.hashes)
end

Then /I should see the following rows in the view billing table:$/ do |expected_table|
	data = expected_table.raw
	puts data
	data.each do |row|
		page.find('tr', text: row[0]).should have_content(row[1],row[2])
	end
end

Then /^I should see "(.*)" button/ do |name|
  find_button(name).should_not be_nil
end


Then /"(.*)" should have trivial div$/ do |divid|
	!(page.has_xpath?("//div[@style='display:none' and @id=#{divid}]"))
end 

Then /"(.*)" should not have trivial div$/ do |divid|
	page.has_xpath?("//div[@style='display:none' and @id=#{divid}]")
end 