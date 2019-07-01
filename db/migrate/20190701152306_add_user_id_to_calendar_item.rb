class AddUserIdToCalendarItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :calendar_items, :user, index: true
  end
end
