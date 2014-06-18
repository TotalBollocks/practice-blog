class User < ActiveRecord::Base
	has_secure_password
  
  before_validation :generate_slug
  
  has_many :articles
  has_and_belongs_to_many :roles
  
  validates :email, :slug, presence: true, uniqueness: { message: "has been taken" }
  validates :username, presence: true
  
  def to_param
    slug
  end
  
  def has_role?(name)
    role = Role.where(name: name).take
    self.roles.include?(role)
  end
  
  private
  
  def generate_slug
    self.slug = username.parameterize
  end
end
