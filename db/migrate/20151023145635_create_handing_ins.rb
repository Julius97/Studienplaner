class CreateHandingIns < ActiveRecord::Migration
  def change
    create_table :handing_ins do |t|
      t.string :name

      t.timestamps
    end
  end
end
