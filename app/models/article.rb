class Article < ActiveRecord::Base
	belongs_to :subject
	has_many :sections

	validates :title, :subject, presence: true
end
