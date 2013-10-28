class ViewquotasController < ApplicationController
  def index
    @storage_data = {"Bob" => {"proj1" => "54%", "proj2" => "26%", "proj3" => "20%"}}
  end
end
