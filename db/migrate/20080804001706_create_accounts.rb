class CreateAccounts < ActiveRecord::Migration
	def self.up
		create_table :accounts do |t|
			t.string :bank
			t.string :agency
			t.string :number
			t.decimal :resources, :precision => 8, :scale => 2

			t.timestamps
		end
	end

	def self.down
		drop_table :accounts
	end
end
