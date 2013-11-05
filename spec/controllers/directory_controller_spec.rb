require 'spec_helper'

describe DirectoryController do 
		describe 'change_quota action' do
			before :each do
				valid_quota=5
				invalid_quota=100000
				directory=Factory(:directory)
			end
			it 'should call directory method change_quota' do
				Directory.should_receive(:change_quota).with(quota)
				get :change_quota, 'id'=>directory.id, "change_quota" => quota
			end
			describe "after valid change_quota" do
				before :each do
					get :change_quota, 'id'=>directory.id, "change_quota" => valid_quota
				end
				it "flash message should be 'Submitted!'"
					flash.should == "Submitted"
				end
				it "should render detailed_view of that directory" do
					response.should redirect_to('/detailed_view/'+directory.id.to_s)
				end
			end
			describe "after invalid change_quota" do
				before :each do
					get :change_quota, 'id'=>directory.id, "change_quota" => invalid_quota
				end
				it "flash message should be 'Submitted!'"
					flash.should == "Invalid Quota"
				end
				it 'should render detialed_view of that directory' do
					response.should redirect_to('/detailed_view/'+directory.id.to_s)
				end
			end
		end
end