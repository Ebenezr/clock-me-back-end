class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :avatar, :string 
    add_column :employees, :avatar, :string 
  end
end
