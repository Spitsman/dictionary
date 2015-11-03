class Article < ActiveRecord::Base
	belongs_to :request
	has_many :translation_articles
	accepts_nested_attributes_for :translation_articles
end
