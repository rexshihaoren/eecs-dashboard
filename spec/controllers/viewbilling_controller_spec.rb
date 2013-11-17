describe ViewbillingController do
	before :each do
		@usage = FactoryGirl.create :usage
		@other_usage = FactoryGirl.create(:usage, date: '11/13/13')
	end
	describe 'index action' do
	  pending "add some examples"
	end
end