Given /^the following quota exist:$/ do |table|
  Quota.create!(table.hashes)
end

Given /^the following usages exist:$/ do |table|
  Usage.create!(table.hashes)
end
