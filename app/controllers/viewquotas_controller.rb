class ViewquotasController < ApplicationController
  require 'date'
  def index
    if session[:user_name] == nil 
      session[:user_name] = "aculich"
    end

    names = Usage.find_all_by_user(session[:user_name])
    @user_name = session[:user_name]

    if params[:quota_name]
        flash.now[:notice] = ("Directory Quota was successfully changed")
    end 
   

    @max_values = []
    @current_values = []
    counter = 6
    hash = {}
    names.each do |usage|
      hash[usage.directory] = "#{((usage.usage.to_f/usage.max)*100).round(2)}%"
      date = usage.date.split('.')
       ## TODO Convert dates into integer that can be evaluated by the graph
      epoch = Date.new(2013, date[0].to_i, date[1].to_i)
      @current_values << [counter.day.ago.to_i * 1000, usage.usage]
      @max_values << [counter.day.ago.to_i * 1000, usage.max]
      counter = counter - 1
    end
    @storage_data = {[session[:user_name]] => hash}
  end
  def change_quota
    
  end 
end