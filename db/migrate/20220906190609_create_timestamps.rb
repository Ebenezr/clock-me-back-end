class CreateTimestamps < ActiveRecord::Migration[6.1]
  def change
    create_table :timestamps do |t|
      t.integer :employee_id
      
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thursday
      t.integer :friday
     
      t.timestamps
    end
  end
end
