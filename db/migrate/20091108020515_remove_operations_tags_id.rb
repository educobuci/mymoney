class RemoveOperationsTagsId < ActiveRecord::Migration
  def self.up
      remove_column :operations_tags, :id
  end

  def self.down
      add_column :operations_tags, :id, :integer
  end
end
