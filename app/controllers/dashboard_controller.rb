class DashboardController < ApplicationController
  def index 
	@isDependant = params[:dependant] != NIL
	if(@isDependant)
	        session[:dependant] = params[:dependant]
		@myName = session
	end
	
  end
end
