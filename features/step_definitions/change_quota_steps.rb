Then /I should see a detailed view of the quota history$/ do
  pending # express the regexp above with the code you wish you had
end

Given /the current_month is (\d+)$/ do |m|
	Time.now.month==m
end

Given /the following usage_history exist:$/ do |usage|
	Usage.create!(usage.hashes)
end

