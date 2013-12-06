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
	@dependantsinfo = {}
        @dependants.each do |doge|
		toadd = []
		toadd.append(Usage.get_total_cost(doge.login))
		toadd.append(Usage.get_total_storage(doge.login))
		toadd.append(Usage.get_total_quota(doge.login))
		@dependantsinfo[doge.login] = toadd
	end
	generate_chart
  end

def generate_chart
	@pie_chart = {}
	@dependants.each do |dep|
	@pie_chart[dep.login] = Usage.get_total_cost(dep.login)
	end
	@pie_chart_series = []

	@pie_chart.each do |key, value|
	@pie_chart_series << [key.to_s , value]
	end
    end

end
