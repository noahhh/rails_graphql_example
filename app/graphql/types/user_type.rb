module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :netid, String, null: true
    field :calendar_items, [Types::CalendarItemType], null: true
    field :item_count, Integer, null: true

    def item_count
      object.calendar_items.size
    end
  end
end
