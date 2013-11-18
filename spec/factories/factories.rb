

FactoryGirl.define do

	factory :directory do
	  id 1
	  name 'proj1'
	  usage 6
	  quota 10
	end

	factory :usage do
		user 'fox'
		directory 'cs169'
		date '11/11/13'
		usage 100
		rate 10
	end

	factory :quota do
		user 'fox'
		directory 'proj1'
		quota 1000
	end
end
