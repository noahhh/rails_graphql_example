module Types
  class QueryType < BaseObject
    # queries are just represented as fields
    # `all_items` is automatically camelcased to `allItems`

    #object type
    field :all_items, [CalendarItemType], null: false do
      description "Return all items"
    end
    field :by_id, CalendarItemType, null: true do
      description "Find an item by id"
      argument :id, Integer, required: true
    end

    # this method is invoked when `all_items` fields is being resolved
    #resolvers
    def all_items
      CalendarItem.all
    end

    def by_id(id:)
      begin
        item = CalendarItem.find(id)
      rescue => e
        GraphQL::ExecutionError.new("Invalid input: #{e}")
      end
    end
  end
end
