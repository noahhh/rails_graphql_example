module Mutations
  module CalendarItems
    class CreateCalendarItem < BaseMutation
      description 'Creates a CalendarItem'

      argument :title, String, required: true
      argument :description, String, required: true
      argument :user_id, ID, required: true

      type Types::CalendarItemType

      def resolve(description:, title:, user_id:)
        CalendarItem.create!( description: description, title: title, user_id: user_id)
      end
    end
  end
end
