class RenameUserToDefaultUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :timeslots, :user_id, :default_user_id
  end
end
