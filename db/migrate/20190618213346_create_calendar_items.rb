class CreateCalendarItems < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_items do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
