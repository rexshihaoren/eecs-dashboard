class DashboardController < ApplicationController
  def index 
	@isDependant = params[:dependant] != NIL
	@user_name = "aculich";  #hardcoded for now, later we need to do a modularized structure
	if(@isDependant)
	        session[:dependant] = params[:dependant]
		@myName = session
	end
	@totalbilling = Usage.get_total_cost(@user_name)
        @totalbilling_for_dependants = 0
	User.find_dependants(@user_name).each do |dep|
          @totalbilling_for_dependants += Usage.get_total_cost(dep.login)
        end
	@totalusage = Usage.get_total_storage(@user_name)
	@totalquota = Usage.get_total_quota(@user_name)
	
  end
end
