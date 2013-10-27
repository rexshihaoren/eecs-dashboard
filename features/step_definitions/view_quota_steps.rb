
Then /I should see all percentages_of_usage/ do
	data = {"Bob" => {"proj1" => 0.97, "proj2" => 0.45, "proj3" => 0.28}}
	quotas = data["Bob"]
	quotas.each do |key,value|
	  step %{I should see "#{key}"}
	  step %{I should see "#{value}"}
	end
end
