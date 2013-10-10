# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
      Movie.create! movie
  end
end

Given /And I am on the RottenPotatoes home page/ do |page_name|
  visit path_to(page_name)
end

When /^I check '(.*)'$/ do |field|
  result =  "ratings_" + field
  check(result)
end

When /^(?:|I )uncheck '(.*)'$/ do |field|
  result = "ratings_" + field
  uncheck(result)
end

When /^(?:|I )press the refresh button$/ do 
  click_button("ratings_submit")
end



Then(/^'(.*)' and '(.*)' movies are visible$/) do |r1, r2|
  
end

Then(/^'(.*)' and '(.*)' movies are not visible$/) do |r1, r2|
  
end

Then /I should(n't)? see ratings (.*)/ do |which, title_list|
  puts "which #{which}"
  titles = title_list.split(", ")
    titles.each do |title|
      puts "Findings #{find('#movies').find('tbody').first('tr', :text => " #{title} ")}"

      if find('#movies').respond_to? :should
        if which == "n't" then
          assert find('#movies').find('tbody').first('tr', :text => " #{title} ") == nil
        else
          assert find('#movies').find('tbody').first('tr', :text => " #{title} ") != nil
           #find('#movies').find('tbody').should have_content(" #{title} ")
        end
      else
        if which then
          assert page.has_content?(title) == false
        else
          assert page.has_content?(title)
        end          
      end
  end
end



Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  puts "Page = #{page.body}"
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
end
