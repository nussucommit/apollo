class AddTimeColumns < ActiveRecord::Migration[5.0]
  def change
	add_column :time_ranges, :start, :datetime, null:false
	add_column :time_ranges, :end, :datetime, null:false
  end
end
