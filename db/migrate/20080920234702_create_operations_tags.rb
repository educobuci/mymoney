class CreateOperationsTags < ActiveRecord::Migration
  def self.up
    create_table "operations_tags" do |t|
        t.integer :operation_id
        t.integer :tag_id
    end
  end

  def self.down
    drop_table "operations_tags"    
  end
end
