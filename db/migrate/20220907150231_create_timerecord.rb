class CreateTimerecord < ActiveRecord::Migration[6.1]
  def change
    create_table :timerecords do |t|
      t.integer :employee_id

      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
     
      t.timestamps
  end
end
end
