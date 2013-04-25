class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :surname, :userid
end
