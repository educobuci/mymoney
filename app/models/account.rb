class Account < ActiveRecord::Base
	has_many :operations
	validates_presence_of :agency, :bank, :number
end
