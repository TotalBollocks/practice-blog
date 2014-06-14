class User < ActiveRecord::Base
	has_secure_password
  
  has_many :articles
  
  validates :email, presence: true, uniqueness: { message: "has been taken" }
  validates :username, presence: true
end
