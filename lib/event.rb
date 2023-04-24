require 'time'

class Event
  attr_accessor :start_date, :attendees, :duration, :title

  def initialize(start_date:, duration:, attendees:, title:)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees
  end

  def self.create_event(date:, duration:, attendees:, title:)
    Event.new(start_date: date, duration: duration, attendees: attendees, title: title)
  end

  def to_s
    "Date : #{@start_date}\nDuration : #{@duration}\nTitle : #{@title}\nAttendees : #{@attendees.join(", ")}"
  end
end

event = Event.create_event(date: "2019-01-13 09:00", duration: 10, title: "standup quotidien", attendees: ["truc@machin.com", "bidule@chose.fr"])
puts event
