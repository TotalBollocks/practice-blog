class Article < ActiveRecord::Base
	belongs_to :subject
  belongs_to :user
	has_many :sections

  validates :title, :subject, :user, presence: true
end
