class AlterAddDateToOperation < ActiveRecord::Migration
	def self.up
		rename_column :operations, :date, :pay_date
		add_column :operations, :expiration_date, :date
	end

	def self.down
		rename_column :operations, :pay_date, :date
		remove_column :operations, :expiration_date
	end
end
