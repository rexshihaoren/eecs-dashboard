class User < ActiveRecord::Base
  attr_accessible :login, :payer

  def self.find_dependants(user)
    return User.where(payer: user)
  end

end
