module Mutations
  module CalendarItems
    class UpdateCalendarItem < BaseMutation
      description 'Updates a Calendar Item'

      argument :id, ID, required: true
      argument :title, String, required: true
      argument :description, String, required: true

      type Types::CalendarItemType

      def resolve(id:, **attributes) #id: nil, description: nil, title: nil
        CalendarItem.find(id).tap do |cal|
          cal.update!(attributes)
        end
      end
    end
  end
end
