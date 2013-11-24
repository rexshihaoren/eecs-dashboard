# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user = "Bob"
directory = "proj1"
usage = [50,73,86,104,92,88]
max = [100,100,120,140,140,140]

(1..6).each do |num|
  date = "11." + num.to_s + ".13"
  Usage.create!(:user => user, :date => date, :directory => directory, :max => max[num-1], :usage => usage[num-1])
end

user = "Bill"
usage = [40,53,80,120,150,145]
max = [50,80,100,150,200,200]
(1..6).each do |num|
  date = "11." + num.to_s + ".13"
  Usage.create!(:user => user, :date => date, :directory => directory, :max => max[num-1], :usage => usage[num-1])
end

User.create!(:login => "aculich", :payer => nil)
User.create!(:login => "Bob", :payer => "aculich")
User.create!(:login => "Bill", :payer => "aculich")


