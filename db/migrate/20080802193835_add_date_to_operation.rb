class AddDateToOperation < ActiveRecord::Migration
	def self.up
		add_column :operations, :date, :date
	end

	def self.down
		remove_column :operations, :date
	end
end
