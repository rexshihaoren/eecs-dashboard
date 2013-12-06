class Usage < ActiveRecord::Base
  attr_accessible :date, :directory, :usage, :user, :max, :rate

  def self.getHistoryforUserDirectory(user, directory)
	return Usage.where(user: user, directory: directory).order(:date)
  end

  def self.get_model_by_user_and_proj(user, proj)
	return Usage.where(user: user, directory: proj)
  end

  def self.parse_date(date)
    date = date.split('.')
    newdate = '20' + date[2] + '-' + date[0] + '-' + date[1]
    temp = '20' + date[2]
    date = DateTime.new(temp.to_i, date[0].to_i, date[1].to_i)
    return date
  end

  def self.get_most_recent_model(user)
    date_for_user = Usage.find_all_by_user(user)
    @most_recent_usage_dates = {}
    date_for_user.each do |usage_model|
      date = Usage.parse_date usage_model.date
      if @most_recent_usage_dates[usage_model.directory] 
        recent_date = Usage.parse_date (@most_recent_usage_dates[usage_model.directory].date)
	if recent_date < date
	  @most_recent_usage_dates[usage_model.directory] = usage_model
        end
      else 
	@most_recent_usage_dates[usage_model.directory] = usage_model
      end
    end  #@most_recent_usage_date should contain a list of records for most recent usages
    return @most_recent_usage_dates
  end

#total amount of storage used for a single user across all directories
  def self.get_total_storage(user)
    data = self.get_most_recent_model(user)
    total = 0
    data.each do |dir,usage_model|
      total += usage_model.usage
    end
    return total
  end

#total quota "" ""
  def self.get_total_quota(user)
    data = self.get_most_recent_model(user)
    total = 0
    data.each do |dir,usage_model|
      total += usage_model.max
    end
    return total
  end

#total amount i'm spending on myself
  def self.get_total_cost(user)
    return Usage.get_total_storage(user)*0.09 + 92  #total storage used * rate + 92 base fee
  end

end
