class AddDutiesColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :duties, :date, :date
    add_reference :duties, :timeslot, foreign_key: true
    add_reference :duties, :user, foreign_key: true
  end
end
