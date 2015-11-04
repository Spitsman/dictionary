class User < ActiveRecord::Base
	acts_as_authentic
	has_many :requests
	validates :crypted_password, { length: { minimum: 6 } }
	validates :username, { length: { minimum: 4, maximum: 25 } }
	accepts_nested_attributes_for :requests

	def admin?
		self.role == 'admin'
	end
end
