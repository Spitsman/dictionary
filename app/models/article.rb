class Article < ActiveRecord::Base
	#validates :request, presence: :true
	belongs_to :request
	has_many :translation_articles
	accepts_nested_attributes_for :translation_articles
end
