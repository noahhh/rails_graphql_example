class CalendarItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      @cal_items = CalendarItem.all
      render json: @cal_items
  end

  def create
    @c = CalendarItem.new(calendar_item_params)
    if @c.save
      render json: @c, status: :created
    else
      render json: @c.errors, status: :unprocessable_entity
    end
  end

  private

  def calendar_item_params
    params.require(:calendar_item).permit(:title, :description, :start_date, :end_date)
  end
end

# curl -d '{"title":"Noahs title", "description":"Description here!"}' -H "Content-Type: application/json" -X POST http://localhost:3002/calendar_item/create




# curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"description":"Hello!","title":"title"}'  http://localhost:3002/calendar_items/create

# curl -X POST -H "Content-Type: application/json" -d '{"calendar_item": {
#     "title": "foo",
#     "description": "bar"
#    }
# }' 127.0.01:3002/calendar_items/create.json


# curl --header "Content-Type: application/json" \
#   --request POST \
#   --data '{"title":"xyz","description":"xyz"}' \
#   http://localhost:3002/calendar_items/create
