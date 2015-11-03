class User < ActiveRecord::Base
	acts_as_authentic
	has_many :requests
	validates :crypted_password, { length: { minimum: 6 } }
	validates :username, { length: { minimum: 4, maximum: 25 } }
end
