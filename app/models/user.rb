class User < ActiveRecord::Base
	has_secure_password
  
  has_many :articles
  has_and_belongs_to_many :roles
  
  validates :email, presence: true, uniqueness: { message: "has been taken" }
  validates :username, presence: true
  
  def has_role?(name)
    role = Role.where(name: name).take
    self.roles.include?(role)
  end
end
