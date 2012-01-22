class User < ActiveRecord::Base
  has_secure_password

  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true, :on => :create

  # Returns an array of symbols for this user's security roles, e.g. [:producer, :actor].
  # Returns an empty array if this user has no security roles.
  def security_roles
    [:producer, :director, :actor].find_all { |role| self.send role }
  end
end
