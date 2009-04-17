class AccountAlias < ActiveRecord::Migration
  	def self.up
		add_column :accounts, :alias, :string
	end

	def self.down
		remove_column :accounts, :alias
	end
end
