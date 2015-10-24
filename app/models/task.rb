class Task < ActiveRecord::Base

	belongs_to :subject
	belongs_to :task_type, :polymorphic => true

	validates :handing_in_time, :presence => true
	validates :subject_id, :presence => true, :numericality => { :only_integer => true }
	validates :task_type_id, :presence => true, :numericality => { :only_integer => true }
	validate :handing_in_time_in_future

	def handing_in_time_in_future
		errors.add("Abgabedatum muss in Zukunft liegen") if self.handing_in_time <= DateTime.now
	end

end