class DateTimeToTime < ActiveRecord::Migration[5.0]
  def change
    remove_column :time_ranges, :start
    remove_column :time_ranges, :end
    add_column :time_ranges, :start, :time, null:false
    add_column :time_ranges, :end, :time, null:false
  end
end
