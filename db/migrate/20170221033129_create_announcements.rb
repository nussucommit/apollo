class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.string :title, null: false
      t.text :contents, null: false
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
