class AddPlaceColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :name, :string
  end
end
