

Given /aculich is being billed for Bob and Bill$/ do
        User.create!(:login => "aculich")
	User.create!(:login => "Bob", :payer => "aculich")
	User.create!(:login => "Bill", :payer => "aculich")
end


