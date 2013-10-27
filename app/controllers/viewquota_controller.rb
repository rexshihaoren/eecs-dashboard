class ViewQuotaController < ApplicationController

  def index
    @storage_data = {"Bob" => {"proj1" => 0.97, "proj2" => 0.45, "proj3" => 0.28}}
  end
end
