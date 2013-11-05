

Given /the following directories exist:$/ do |directories|
	Directory.create!(directories.hashes)
end
