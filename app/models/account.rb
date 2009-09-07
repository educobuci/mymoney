class Account < ActiveRecord::Base
	belongs_to :user
	has_many :operations
	validates_presence_of :agency, :bank, :number
	
	def previous_balance(filter_date) 
		
		previous_operations = operations.select {|o| o.created_at < filter_date.at_beginning_of_month}
			
		previous_operations.sum do |o|
			o.value
		end
	end
end
