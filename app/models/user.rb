class User < ActiveRecord::Base
	has_secure_password
  
  has_many :articles
  has_and_belongs_to_many :roles
  
  validates :email, presence: true, uniqueness: { message: "has been taken" }
  validates :username, presence: true
end
