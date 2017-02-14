class AddUserColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :matric_number, :string
    add_column :users, :phone_number, :string
    add_column :users, :cell, :string
    add_column :users, :position, :string
  end
end
