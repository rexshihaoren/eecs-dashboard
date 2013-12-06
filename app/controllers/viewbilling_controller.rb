class ViewbillingController < ApplicationController
   require 'date'
   require 'json'

   def set_user_name
    if session[:user_name] == nil 
      session[:user_name] = "aculich"
    end
  end

  def dummy_dates_for_history 
    amount_of_items = 8
    @dummy_dates = []
    7.downto 0 do |v|
      @dummy_dates << (Time.now - v.day).strftime("%m-%d-%Y")
    end
  end

  def compute_graph_history length
    @size_of_graph = length
    @series_history_data = []
    initial_date length
    user_items_history Usage.find_all_by_user(@user_name)
    @series_history_data = @series_history_data.to_json
  end

  def user_items_history usage_hash
    names_hash = {}
    usage_hash.each do |k|
      if names_hash[k[:directory]] == nil 
        temp = (k[:rate] * k[:usage]).round(2)
        names_hash[k[:directory]] = [temp]
      else
        if (names_hash[k[:directory]].length < @size_of_graph)
          names_hash[k[:directory]] << (k[:rate] * k[:usage]).round(2)
        end
      end 
    end
    names_hash.each do |k, v|
      hash = {}
      hash["name"] = k
      hash["data"] = v
      @series_history_data << hash
      
    end 
    #generator "dfkj"
  end

def generator direct
    a = Usage.new 
    a.rate = 0.09 
    a.directory =  "eecs" 
    a.user = "aculich"
    temp = 1 + rand(15)
    a.date = "10." +  temp.to_s + ".14"
    a.usage = 50 + rand(50)
    a.max = 100 + rand(50) 
    a.save!
  end

  def initial_date length
    returnArray = []
    hash_CIF = {}
    hash_ICF = {}
    hash_SIF = {}
    hash_CIF["name"] = "CIF"
    hash_ICF["name"] = "ICF"
    hash_SIF["name"] = "SIF"
    hash_CIF["data"] = []
    hash_ICF["data"] = []
    hash_SIF["data"] = []
    1.upto length do |v|
      hash_CIF["data"] << 72 
      hash_ICF["data"] << 10 
      hash_SIF["data"] << 10
    end 
    @series_history_data << hash_CIF
    @series_history_data  << hash_ICF
    @series_history_data  << hash_SIF
    
  end 

  def set_graph graph 
    if graph == "current"
      session[:graph] = "current"
      @hide_current =  "true"
    else 
      session[:graph] = "history"
      @hide_current =  nil 
    end
      dummy_dates_for_history
      @graph = session[:graph]
  end

  def set_dependent dependant
      @dependant = dependant
    if params[:dependant] != nil
      @user_name = params[:dependant]
    else
      @user_name = session[:user_name]
    end
    @most_recent_usage_dates = Usage.get_most_recent_model(@user_name)
    compute_cost @most_recent_usage_dates
   end

  def index
    set_user_name
    set_graph params[:graph]
    set_dependent params[:dependant]
    compute_graph_history @pie_chart.length
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

<<<<<<< HEAD
=======
  def parse_date date
    date = date.split('.')
    newdate = '20' + date[2] + '-' + date[0] + '-' + date[1]
    temp = '20' + date[2]
    date = DateTime.new(temp.to_i, date[0].to_i, date[1].to_i)
    date
  end 

>>>>>>> 96ee3f73622568467626954c905f387936888708
end
