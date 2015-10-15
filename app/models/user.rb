class User < ActiveRecord::Base
	has_secure_password 
	validates :password, { length: { minimum: 6 } }
	validates :username, { length: { minimum: 4, maximum: 25 } }
end
