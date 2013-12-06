require 'spec_helper'

describe Usage do
	before :each do
		@usage = FactoryGirl.create(:usage, date: '11.11.13')
		@other_usage = FactoryGirl.create(:usage, date: '11.13.13', usage: 100, rate:0.09, max:150)
	end
	it 'should include directory, usage, rate, and date' do
		@usage.user == 'fox'
		@usage.directory == 'cs169'
		@usage.usage == 100
		@usage.rate == 0.09
		@usage.date == '11.11.13'
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

	describe 'action get_most_recent_model' do
		it 'should return most recent model' do
			expect(Usage.get_most_recent_model('fox')).to eq({"cs169"=>@other_usage})
		end
	end

	describe 'action get_total_storage' do
		it 'should return total storage' do
			expect(Usage.get_total_storage('fox')).to eq(100)
		end
	end
 
	describe 'action get_total_quota' do
		it 'should return total quota' do
			expect(Usage.get_total_quota('fox')).to eq(150)
		end
	end

	describe 'action get_total_cost' do
		it 'should return total cost' do
			expect(Usage.get_total_cost('fox')).to eq(101)
		end
	end

end
