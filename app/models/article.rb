class Article < ActiveRecord::Base
	belongs_to :subject
  belongs_to :user
	has_many :sections

	validates :title, :subject, presence: true
end
