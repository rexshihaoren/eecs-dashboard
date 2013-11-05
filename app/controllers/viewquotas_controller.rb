class ViewquotasController < ApplicationController
  def index
    if params[:quota_name]
	flash.now[:notice] = ("Directory Quota was successfully changed")
    end 
    puts "params #{params.inspect}"
    @storage_data = {"Bob" => {"proj1" => "54%", "proj2" => "26%", "proj3" => "20%"}}
  end
  def change_quota
    
  end 
end
