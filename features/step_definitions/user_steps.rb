# Add a declarative step here for populating the DB with movies.

Given /the following directories exist/ do |directory_table|
  #directory_table.hashes.each do |directory|
   #   Directory.create! directory
  #end
end

#Given /And I am on the dashboard page/ do |page_name|
 # visit path_to(page_name)
#end


When /^(?:|I )follow '(.*)'$/ do |link|
  click_link(link)
end





