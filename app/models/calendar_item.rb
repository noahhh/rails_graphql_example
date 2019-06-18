class CalendarItem < ApplicationRecord

  def self.populate_calendar_items
    parsed_json = fetch_and_parse
    create_items(parsed_json)
  end

  def self.fetch_and_parse
    resp = Faraday.get(url())
    body = resp.body
    JSON.parse(body)
  end

  def self.create_items(parsed_json)
    parsed_json["events"].each do |event|
      create_calendar_item(event)
    end
  end

  def self.create_calendar_item(event)
    CalendarItem.create({
      title: event["summary"],
      description: event["description"],
      start_date: event["start_timestamp"],
      end_date: event["end_timestamp"]
    })
  end

  def self.url
    "https://calendar.duke.edu/events/index.json?&future_days=1&feed_type=simple"
  end
end
