class ViewdependantsController < ApplicationController
 def set_user_name
    if session[:user_name] == nil 
      session[:user_name] = "aculich"
    end
  end

  def index
    set_user_name
    @user_name = session[:user_name]
    @dependants = User.where(payer: @user_name)
 
  end

end
