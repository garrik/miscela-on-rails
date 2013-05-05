class User < ActiveRecord::Base
  attr_accessible :email, :name, :surname, :userid, :password, :password_confirmation
  has_secure_password

  before_save do |user| 
  	user.userid = user.userid.downcase
  	user.email = user.email.downcase
  end
  before_save :create_remember_token

  validates(:userid, :presence => true, :uniqueness => true)
  validates(:email, :presence => true, :uniqueness => true)
  validates(:password, :presence => true, :length => { :minimum => 6 })
  validates(:password_confirmation, :presence => true)

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end

