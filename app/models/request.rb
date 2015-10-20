class Request < ActiveRecord::Base
	validates :lang, presence: true
	validates :text, presence: true
	belongs_to :user
	has_many :articles
end
