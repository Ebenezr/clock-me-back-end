class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password 
      t.string :username 
      t.string :gender 
      t.string :title 
      t.boolean :usertype 

      t.timestamps
  end 
  end
end
