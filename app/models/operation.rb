class Operation < ActiveRecord::Base
	belongs_to	:account
	has_and_belongs_to_many :tags
	validates_presence_of :name, :value
end
