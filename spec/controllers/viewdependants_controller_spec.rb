require 'spec_helper'
require 'date'
describe ViewdependantsController do
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
	end



end
