class Article < ActiveRecord::Base
	belongs_to :subject
	has_many :sections

	validates :title, presence: true
end
