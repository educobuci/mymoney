class CreateOperations < ActiveRecord::Migration
  def self.up
    create_table :operations do |t|
      t.string :name
      t.string :details
      t.integer :type
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :operations
  end
end
