require 'spec_helper'

describe User do
	before :each do
		@userL = FactoryGirl.create :user
		@userA = FactoryGirl.create :user
		@userD = FactoryGirl.create :user
		@userL.login = "Liz"
		@userA.login = "Ashkon"
		@userD.login = "Dawn"
		@userL.payer = "Dawn"
		@userA.payer = "Dawn"
	end
	describe 'action find_dependants' do
		it 'should return nothing if no dudes' do
			expect(User.find_dependants('Ashkon')).to eq([])
		end
	end
end
