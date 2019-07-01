module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::Users::CreateUser
    field :create_calendar_item, mutation: Mutations::CalendarItems::CreateCalendarItem
    field :remove_calendar_item, mutation: Mutations::CalendarItems::RemoveCalendarItem
    field :update_calendar_item, mutation: Mutations::CalendarItems::UpdateCalendarItem
  end
end
