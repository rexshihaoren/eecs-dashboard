getclass Quota < ActiveRecord::Base/Q
  attr_accessible :directory, :quota, :user
  

  def self.getQuotaforUserDirectory(user, directory)
	return Quota.where(user: user, directory: directory)
  end
end
