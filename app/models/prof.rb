class Prof < ActiveRecord::Base

	belongs_to :subject

	validates :name, :presence => true, :uniqueness => true
	validates :subject_id, :presence => true, :uniqueness => true

end