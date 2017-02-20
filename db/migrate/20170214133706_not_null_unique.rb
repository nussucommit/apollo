class NotNullUnique < ActiveRecord::Migration[5.0]
  def change
    change_column_null :duties, :date, false
    change_column_null :duties, :timeslot_id, false
    change_column_null :places, :name, false
    change_column_null :timeslots, :mc_only, false
    change_column_null :timeslots, :day, false
    change_column_null :timeslots, :user_id, false
    change_column_null :timeslots, :time_range_id, false
    change_column_null :timeslots, :place_id, false
    change_column_null :users, :username, false
    change_column_null :users, :name, false
    change_column_null :users, :email, false
    change_column_null :users, :matric_number, false
    change_column_null :users, :phone_number, false
    change_column_null :users, :cell, false
    change_column_null :users, :position, false
  end
end
