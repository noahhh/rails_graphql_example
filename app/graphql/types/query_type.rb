module Types
  class QueryType < BaseObject

    field :user, UserType, null: false do
      description 'Find a User by ID'
      argument :id, ID, required: true
    end

    field :calendar_item, CalendarItemType, null: false do
      description 'Find an Item by ID'
      argument :id, ID, required: true
    end

    field :all_calendar_items, [CalendarItemType], null: false do
      description 'Return all Items'
    end

    def user(id:)
      User.find(id)
    end

    def calendar_item(id:)
      CalendarItem.find(id)
    end

    def all_calendar_items
      CalendarItem.all
    end

  end
end
