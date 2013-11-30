require 'spec_helper'

describe Usage do
	before :each do
		@usage = FactoryGirl.create :usage
		@other_usage = FactoryGirl.create(:usage, date: '11/13/13')
	end
	it 'should include directory, usage, rate, and date' do
		@usage.user == 'fox'
		@usage.directory == 'cs169'
		@usage.usage == 100
		@usage.rate == 10
		@usage.date == '11/11/13'
	end
	describe 'action getHistoryforUserDirectory' do
		it 'should return usages ordered by date' do
			expect(Usage.getHistoryforUserDirectory('fox', 'cs169')).to eq([@usage, @other_usage])
		end
	end

	describe 'action get_model_by_user_and_proj' do
		it 'should return usages by user and directory' do
			Usage.get_model_by_user_and_proj('fox','cs169').should include(@usage, @other_usage)
		end
	end
end