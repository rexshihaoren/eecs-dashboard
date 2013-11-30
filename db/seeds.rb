# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user = "Bob"
directory = "proj2"
usage = [70,90,120,104,130,120]
max = [100,100,150,140,150,150]

(1..6).each do |num|
  date = "11." + num.to_s + ".13"
  Usage.create!(:user => user, :date => date, :directory => directory, :max => max[num-1], :usage => usage[num-1])
end

user = "Bill"
usage = [100,120,120,110,80,90]
max = [120,150,150,150,100,100]
(1..6).each do |num|
  date = "11." + num.to_s + ".13"
  Usage.create!(:user => user, :date => date, :directory => directory, :max => max[num-1], :usage => usage[num-1])
end



