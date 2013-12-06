class ViewbillingController < ApplicationController
   require 'date'
 
   def set_user_name
    if session[:user_name] == nil 
      session[:user_name] = "aculich"
    end
  end


  def index
    set_user_name
    @dependant = params[:dependant]
    if params[:dependant] != nil
	@user_name = params[:dependant]
    else
    	@user_name = session[:user_name]
    end
    @most_recent_usage_dates = Usage.get_most_recent_model(@user_name)
     compute_cost @most_recent_usage_dates
  end

  def compute_cost hash
    @cost = {}
    @monthlyRate = {}
    @usageCost = {}
    @total_cost = 92 
    @pie_chart = {}

    @cost["CIF"] = "$72"
    @monthlyRate["CIF"] = "$72.00"
    @usageCost["CIF"] = "n/a"
    @cost["ICF"] = "$10"
    @monthlyRate["ICF"] = "$10.00"
    @usageCost["ICF"] = "n/a"
    @cost["SIF"] = "$10" 
    @monthlyRate["SIF"] = "$10.00"
    @usageCost["SIF"] = "n/a"
      
    hash.each do |key, value|

      dryness = (value.rate * value.usage).round(2)
      @cost[key] = "$" + dryness.to_s
      @monthlyRate[key] = "$" + value.rate.to_s + "/GB"
      @usageCost[key] = value.usage.to_s + " GB"
      @total_cost += dryness
    end
    @total_cost = @total_cost.round(2)
    @cost.each do |key, value|
    @pie_chart[key] = ((value.gsub('$', '').to_i / @total_cost) * 100).round(2)
   end

   @pie_chart_series = []

   @pie_chart.each do |key, value|
     @pie_chart_series << [key.to_s , value]
   end

   puts " Pie chart Series #{@pie_chart_series.inspect}"
   puts "JSon pie chart2 #{@pie_chart.to_json.html_safe}"

  end

end
