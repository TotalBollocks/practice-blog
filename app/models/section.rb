class Section < ActiveRecord::Base
	belongs_to :article

	validates :content, :article, presence: true
end
