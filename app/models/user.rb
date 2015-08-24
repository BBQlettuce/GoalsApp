class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token , presence: true
  attr_reader :password
  
  def self.find_by_credentials(username, password)

  end
end
