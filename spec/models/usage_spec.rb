require 'spec_helper'

describe Usage do
  	before do 
		usage=Factory(:usage)
	end

	it 'should include directory, usage, rate, and date' do
		usage.user ='fox'
		usage.usage == 100
		usage.rate == 10
		usage.date == '11/11/13'
	end
end
