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
# Then /I should see the following rows in the view billing table:$/ do |expected_table|
#   document = Webrat::XML.html_document(response)

#   rows = document.xpath("//table[@id='viewbilling_table']//tr").collect { |row| row.xpath('.//td|.//th') }
#   puts rows 
#   expected_table = expected_table.raw

#   expected_table.all? do |expected_row|
#     first_row = rows.find_index do |row|
#       expected_row.all? do |expected_column|
#         first_column = row.find_index do |column|
#           Webrat::XML.inner_text(column).include? expected_column.strip
#         end
#         if first_column.nil?
#           false
#         else
#           row = row[(first_column + 1)..-1]
#           true
#         end
#       end
#     end
#     if first_row.nil?
#       false
#     else
#       rows = rows[(first_row + 1)..-1]
#       true
#     end
#   end.should be_true
# end