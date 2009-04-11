class AddAccountToOperation < ActiveRecord::Migration
  def self.up
	  add_column :operations, :account_id, :integer
  end

  def self.down
	  remove_column :operations, :account_id
  end
end
