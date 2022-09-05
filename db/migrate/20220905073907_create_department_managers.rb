class CreateDepartmentManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :department_managers do |t|
      t.integer :department_id
      t.string :employee_id

      t.timestamps
    end
  end
end
