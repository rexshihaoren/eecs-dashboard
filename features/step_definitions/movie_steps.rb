# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
      Movie.create! movie
  end
end

Given /And I am on the RottenPotatoes home page/ do |page_name|
  visit path_to(page_name)
end

When /^I check the following ratings:'(.*)'$/ do |field|
  ratings = field.split(',')
  ratings.each do |r|
   puts "R= #{r}"
   result =  "ratings_" + r
   check(result)
  end
end

When /^(?:|I )press the refresh button$/ do 
  click_button("ratings_submit")
end

Then /I should(n't)? see ratings (.*)/ do |which, title_list|
  puts "which #{which}"
  titles = title_list.split(", ")
    titles.each do |title|
      if find('#movies').respond_to? :should
        if which == "n't" then
          assert find('#movies').find('tbody').first('tr', :text => " #{title} ") == nil
        else
          assert find('#movies').find('tbody').first('tr', :text => " #{title} ") != nil
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

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  ratings = rating_list.split(", ")
  ratings.each do |r|
    result = "ratings_" + r  
    if uncheck == "un" then 
      uncheck(result)   
    else
      check(result)
    end
  end
end

Then /I should see all the movies/ do
  numberOfMovies = Movie.all.count
  rows = find('#movies').find('tbody').all('tr').count
  rows.should == numberOfMovies
end
