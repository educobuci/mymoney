class AccountUser < ActiveRecord::Migration
	def self.up
		add_column :accounts, :user_id, :int
	end

	def self.down
		remove_column :accounts, :user_id
	end
end
