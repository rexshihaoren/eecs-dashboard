require 'spec_helper'
require 'date'
describe ViewquotasController do
	before :each do
		@quota = FactoryGirl.create :quota
		@other_quota = FactoryGirl.create(:quota, directory: 'proj1', user: 'aculich')
		@usage = FactoryGirl.create :usage
		@other_usage0 = FactoryGirl.create(:usage, date: '11/13/13', user: 'aculich', directory: 'proj1')
		@other_usage = FactoryGirl.create(:usage, date: '11/13/13', user: 'aculich', directory: 'proj3', usage: 100)
		@other_usage1 = FactoryGirl.create(:usage, user: "aculich", directory: "proj3", date: "10/23/14", usage: 200)
	end

	describe 'GET index' do
		it 'should call set_user_name' do
			@user_name = 'aculich'
			controller = ViewquotasController.new
			controller.instance_variable_set("@storage_data", [@other_usage, @other_usage1])
			controller.instance_variable_set("@current_directory", 'proj3')
			Usage.stub(:find_all_by_user).with(@user_name).and_return([@other_usage, @other_usage1])
			get :index
			assigns(:user_name).should == 'aculich'

		end

	end
	describe 'change quota' do
		it 'should should be successful' do
			Usage.stub(:get_model_by_user_and_proj).and_return([@other_usage, @other_usage1])
			post :change_quota
			response.should be_successful
		end
	end

end
