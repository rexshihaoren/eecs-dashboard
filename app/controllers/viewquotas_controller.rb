class ViewquotasController < ApplicationController
  require 'date'
  def index
    @max_values = []
    @current_values = []
    @current_directory = nil
    set_user_name
    @dependant = nil
    if params[:dependant] != nil
	@user_name = params[:dependant]
	@dependant = params[:dependant]
    else
    	@user_name = session[:user_name]
    end

    names = Usage.find_all_by_user(@user_name)
    check_change_quota
    set_current_directory(names)
  
    counter = 6
    hash = {}
    print names
    names.each do |usage|
      if usage.directory == @current_directory
        @current_values << [counter.day.ago.to_i * 1000, usage.usage]
        @max_values << [counter.day.ago.to_i * 1000, usage.max]
        counter = counter - 1
      end
	  hash[usage.directory] = "#{((usage.usage.to_f/usage.max.to_f)*100).round(2)}%"
      #date = usage.date.split('.')
      ## TODO Convert dates into integer that can be evaluated by the graph
      #epoch = Date.new(2013, date[0].to_i, date[1].to_i)
      
    end
    print hash
    @storage_data = {@user_name => hash}
  end

  def set_current_directory(names)
    if params[:current_directory] == nil && session[:current_directory] == nil
      session[:current_directory] = names[0].directory 
      flash.keep
      if params[:dependant] != nil
	  redirect_to viewquotas_path({:current_directory => session[:current_directory], :dependant => params[:dependant]})
      else
      	redirect_to viewquotas_path({:current_directory => session[:current_directory]})
      end
    elsif session[:current_directory] == nil
      flash.now[:error] = ("No data found in DB")
    elsif params[:current_directory] == nil
      flash.keep
      if params[:dependant] != nil
	  redirect_to viewquotas_path({:current_directory => session[:current_directory], :dependant => params[:dependant]})
      else
      	redirect_to viewquotas_path({:current_directory => session[:current_directory]})
      end
    else 
        @current_directory = params[:current_directory]
    end
  end 


  def set_user_name
    if session[:user_name] == nil 
      session[:user_name] = "aculich"
    end
  end

  def check_change_quota
    if params[:quota_name]
        new_model = Usage.find(params[:new_model]) 
        new_model.max = params[:quota_name].to_i
        new_model.save!
        session[:current_directory] = params[:current_directory]
	flash.now[:notice] = ("#{new_model.directory} Quota was successfully changed")
        flash.keep
        redirect_to viewquotas_path({:current_directory => session[:current_directory]})
    end 
  end
 
  def change_quota
    model = Usage.get_model_by_user_and_proj(params[:user], params[:modifying_directory])
    @model = model[model.length - 1]
  end 
end
