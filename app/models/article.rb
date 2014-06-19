class Article < ActiveRecord::Base
	belongs_to :subject
  belongs_to :user
	has_many :sections
  
  accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, :subject, :user, presence: true
end
