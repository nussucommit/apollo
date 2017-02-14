class AddTimeslotsColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :timeslots, :mc_only, :boolean
    add_column :timeslots, :day, :integer
    add_reference :timeslots, :user, foreign_key: true
    add_reference :timeslots, :time_range, foreign_key: true
    add_reference :timeslots, :place, foreign_key: true
  end
end
