require 'spec_helper'
require 'date'
describe ViewbillingController do
	before :each do
		@usage = FactoryGirl.create :usage
		@other_usage = FactoryGirl.create(:usage, date: '11/13/13')
		@date_for_user = [@usage, @other_usage]
	end

	describe 'GET index' do
		it 'should call set_user_name' do
			expect(controller).to receive(:set_user_name) 
			get :index
		end
	    it "responds successfully with an HTTP 200 status code" do
	      get :index
	      expect(response).to be_success
	      expect(response.status).to eq(200)
	    end

		it 'should assigns @user_name' do
			get :index
			assigns(:user_name).should == 'aculich'
		end
	    it "renders the index template" do
	      get :index
	      expect(response).to render_template("index")
	    end

	    it "shoud assign @most_recent_usage_dates" do
	    	get :index
	    	assigns(:most_recent_usage_dates).should_not be_nil
	    end

		it 'should call compute_cost' do
			expect(controller).to receive(:set_user_name)
			get :index
		end
		it 'should call set_graph' do
			get :index
			session[:graph].should_not be_nil
		end
	end

	describe 'parse_date' do
		it 'should parse date' do
			expect(controller.parse_date('10.13.13')).to eq(DateTime.new(2013, 10, 13))
		end
	end


end