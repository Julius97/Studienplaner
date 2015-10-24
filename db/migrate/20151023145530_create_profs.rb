class CreateProfs < ActiveRecord::Migration
  def change
    create_table :profs do |t|
      t.string :name
      t.integer :subject_id

      t.timestamps
    end
  end
end
