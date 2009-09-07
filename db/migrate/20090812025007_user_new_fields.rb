class UserNewFields < ActiveRecord::Migration
	def self.up
		add_column :users, :email, :string
		remove_column :users, :full_name
	end

	def self.down
		remove_column :users, :email
		add_column :users, :full_name, :string
	end
end
