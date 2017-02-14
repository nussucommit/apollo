class CreateDuties < ActiveRecord::Migration[5.0]
  def change
    create_table :duties do |t|

      t.timestamps
    end
  end
end
