class Article < ActiveRecord::Base
	belongs_to :request
	has_many :translation_articles
end