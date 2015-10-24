class HandingIn < ActiveRecord::Base

	has_many :tasks, class_name: "Task", :as => :task_type

	validates :name, :presence => true, :uniqueness => true

end