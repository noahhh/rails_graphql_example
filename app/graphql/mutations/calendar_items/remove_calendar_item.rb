module Mutations
  module CalendarItems
    class RemoveCalendarItem < BaseMutation
      description 'Removes a Calendar Item'

      argument :id, ID, required: true

      type Types::CalendarItemType

      def resolve(id: nil)
        CalendarItem.find(id).destroy
      end
    end
  end
end
