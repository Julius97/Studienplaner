class Subject < ActiveRecord::Base

	has_one :prof
	has_many :tasks

	validates :name, :presence => true, :uniqueness => true

end