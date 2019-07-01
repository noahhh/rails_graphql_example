module Types
  class CalendarItemType < BaseObject

    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :start_date, GraphQL::Types::ISO8601DateTime, null: false
    field :end_date, GraphQL::Types::ISO8601DateTime, null: false
    field :user, Types::UserType, null: true
  end
end
