class Quota < ActiveRecord::Base
  attr_accessible :directory, :quota, :user
  

  def self.getQuotaforUserDirectory(user, directory)
	return Quota.where(user: user, directory: directory).quota
  end
end
