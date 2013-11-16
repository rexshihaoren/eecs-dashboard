class ViewbillingController < ApplicationController
   require 'date'
 
   def set_user_name
    if session[:user_name] == nil 
      session[:user_name] = "aculich"
    end
  end


  def index
    set_user_name
    @user_name = session[:user_name]

    date_for_user = Usage.find_all_by_user(session[:user_name])

    @most_recent_usage_dates = {}
    date_for_user.each do |usage_model|
      date = parse_date usage_model.date
      

      if @most_recent_usage_dates[usage_model.directory] 
        recent_date = parse_date (@most_recent_usage_dates[usage_model.directory].date)
	if recent_date < date
	  @most_recent_usage_dates[usage_model.directory] = usage_model
        end
      else 
	@most_recent_usage_dates[usage_model.directory] = usage_model
      end
    end 
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


  def parse_date date
    date = date.split('.')
    newdate = '20' + date[2] + '-' + date[0] + '-' + date[1]
    temp = '20' + date[2]
    date = DateTime.new(temp.to_i, date[0].to_i, date[1].to_i)
    date
 
  end 
end
