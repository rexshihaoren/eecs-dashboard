
class Quota < ActiveRecord::Base
  attr_accessible :directory, :quota, :user
  

  def self.getHistory(user, directory, proj = nil)
	return Quota.where(user: user, directory: directory, proj: proj).order(:date)
  end
  def changeQuota(quota)
	self.quota = quota
	self.save
  end
end
