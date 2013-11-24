class ViewdependantsController < ApplicationController
 def set_user_name
    if session[:user_name] == nil 
      session[:user_name] = "aculich"
    end
  end

  def index
    set_user_name
    @user_name = session[:user_name]
    #@dependants_list = Users.where(master: @user_name) #dummy data
    @dependants_data = {"bob" => ["bob", "$50", "50gigs", "70 gigs"], "amy" => ["amy", "$750", "34gigs", "35 gigs"]}
  end

end
