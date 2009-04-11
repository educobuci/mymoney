class AlterOperationValue < ActiveRecord::Migration
	def self.up
		change_column :operations, :value, :decimal, :presicion => 8, :scale => 2
	end

	def self.down
		change_column :operations, :value, :float
	end
end
