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

Then /I should(n't)? see ratings (.*)/ do |which, rating_list|
  puts "which #{which}"
  ratings = rating_list.split(", ")
    ratings.each do |r|
      if which == "n't" then
        assert find('#movies').find('tbody').first('tr', :text => " #{r} ") == nil, "Ratings that should be there aren't appearing"
      else
        assert find('#movies').find('tbody').first('tr', :text => " #{r} ") != nil, "Ratings that should be there aren't appearing"
      end
   end
end



Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  counter = 0
  positionOfE1 = -1
  positionOfE2 = -1
  page.all('tr').each() do |row|
    row.all('td').each()  do |cell|
      counter = counter + 1
      if cell.text ==  e1
        positionOfE1 = counter
      elsif cell.text == e2
        positionOfE2 = counter
      end
    end 
  end 
  assert positionOfE1 != -1 &&  positionOfE2 != -1, "Items not found in DB"
  assert positionOfE1 < positionOfE2
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

When(/^I press the order by title button$/) do
  click_link("title_header")
end

When(/^I press the order by release_date button$/) do
  click_link("release_date_header")
end



Then /I should see all the movies/ do
  numberOfMovies = Movie.all.count
  rows = find('#movies').find('tbody').all('tr').count
  rows.should == numberOfMovies
end
