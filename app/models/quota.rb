<<<<<<< HEAD
class Quota < ActiveRecord::Base
  attr_accessible :directory, :quota, :user, :proj, :date, :usage
=======
class Quota < ActiveRecord::Base/Q
  attr_accessible :directory, :quota, :user
  
>>>>>>> c5a9a57b2a3b5765fb411cda9e13f811c222c6d4

  def self.getHistory(user, directory, proj = nil)
	return Quota.where(user: user, directory: directory, proj: proj).order(:date)
  end
  def changeQuota(quota)
	self.quota = quota
	self.save
  end
end
