class Usage < ActiveRecord::Base
  attr_accessible :date, :directory, :usage, :user, :max, :rate

  def self.getHistoryforUserDirectory(user, directory)
	return Usage.where(user: user, directory: directory).order(:date)
  end

  def self.get_model_by_user_and_proj(user, proj)
	return Usage.where(user: user, directory: proj)
  end

end
