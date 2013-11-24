
class Quota < ActiveRecord::Base
  attr_accessible :directory, :quota, :user
  

  def changeQuota(quota)
	self.quota = quota
	self.save
  end
end
