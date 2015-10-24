class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :room
      t.string :comment
      t.string :description
      t.datetime :handing_in_time
      t.integer :subject_id
      t.string :task_type_type
      t.integer :task_type_id

      t.timestamps
    end
  end
end
