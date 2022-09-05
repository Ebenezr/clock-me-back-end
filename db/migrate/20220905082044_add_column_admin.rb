class AddColumnAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :department_id, :integer  
  end
end
