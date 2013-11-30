class DashboardController < ApplicationController
  def index 
	@isDependant = params[:dependant] != NIL
	@user_name = "aculich";  #hardcoded for now, later we need to do a modularized structure
	if(@isDependant)
	        session[:dependant] = params[:dependant]
		@myName = session
	end
	
  end
end
