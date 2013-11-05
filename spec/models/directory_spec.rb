require 'spec_helper'

describe Directory do
	before do 
		directory=Factory(:directory)
	end

	it 'should include directory name and usage and quota' do
		directory.name='proj1'
		directory.usage==6
		directory.quota==10
	end

	describe 'change_quota action' do
		before :each do
			valid_quota=5
			invalid_quota=100000
			directory2=FactoryGirl.create(:directory, :name=> 'proj2')
			directory3=FactoryGirl.create(:directory, :name=> 'proj3')
		end
		it "should change directory'quota if change_quota is valid" do
	        lambda {directory2.change_quota(valid_quota)}.should change(directory2.quota).to(valid_quota)
	    end
	    it "should not change directory'quota if change_quota is invalid" do
	    	lambda{directory3.change_quota(invalid_quota)}.should_not change(directory3.quota)
		end
	end
end

