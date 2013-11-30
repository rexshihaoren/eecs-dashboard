require 'spec_helper'

describe Quota do
	before :each do
		@quota = FactoryGirl.create :quota
		@other_usage = FactoryGirl.create(:usage, directory: 'proj1')
	end

	describe 'action chage_quota' do
		it 'should change the quota to the quota specified' do
			@fake_quota = 14
			@quota.changeQuota(@fake_quota)
			expect(@quota.quota).to eq(@fake_quota)
		end
	end
  
end
