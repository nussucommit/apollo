class UniqueOnly < ActiveRecord::Migration[5.0]
  def change
    add_index :places, :name, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :matric_number, unique: true
    add_index :users, :phone_number, unique: true
  end
end
