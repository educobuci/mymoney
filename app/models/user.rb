class User < ActiveRecord::Base
	has_many :accounts
	
	def self.current
		return User.find(:first)
	end
end
