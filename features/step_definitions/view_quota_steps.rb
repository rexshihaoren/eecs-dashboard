
Then /I should see all percentages_of_usage/ do
	data = {"Bob" => {"proj1" => "54%", "proj2" => "26%", "proj3" => "20%"}}
	quotas = data["Bob"]
	quotas.each do |key,value|
	  step %{I should see "#{key}"}
	  step %{I should see "#{value}"}
	end
end
