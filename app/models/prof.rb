class Prof < ActiveRecord::Base

	belongs_to :subject

	validates :name, :presence => true, :uniqueness => true

end