class RenameTimeRangesColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :time_ranges, :start, :start_time
    rename_column :time_ranges, :end, :end_time
  end
end
