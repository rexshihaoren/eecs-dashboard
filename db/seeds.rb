# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user = "Bob"
directory = "project-eecs"
proj = "proj1"
usage = [500,730,860,1040,920,880,1000]
quota = [1000,1000,1200,1400,1400,1200]

(1..7).each do |num|
  date = "7." + num.to_s + ".13"
  Quota.create!(:user => user, :date => date, :directory => "project-eecs", :proj => proj, :quota => quota[num-1], :usage => usage[num-1])
end
proj = "proj2"
usage = [400,530,800,1200,1500,1450,1600]
quota = [500,800,1000,1500,2000,2000,2000]
(1..7).each do |num|
  date = "7." + num.to_s + ".13"
  Quota.create!(:user => user, :date => date, :directory => "project-eecs", :proj => proj, :quota => quota[num-1], :usage => usage[num-1])
end

