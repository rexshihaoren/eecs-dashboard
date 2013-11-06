class Usage < ActiveRecord::Base
  attr_accessible :date, :directory, :usage, :user, :max

  def self.getHistoryforUserDirectory(user, directory)
	return Usage.where(user: user, directory: directory).order(:date)
  end

end
