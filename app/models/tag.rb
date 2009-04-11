class Tag < ActiveRecord::Base
	has_and_belongs_to_many :operations
	
	def self.persiste(tag_string)
		tags = tag_string.split
		ret = []
		for tag in tags
			temp = Tag.find_by_name(tag)
			if temp.nil? then
				temp = Tag.new(:name => tag, :color => '')
				temp.save
			end
			ret << temp
		end
		return ret
	end
end