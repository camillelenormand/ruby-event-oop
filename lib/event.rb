require 'time'
require 'pry'

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

  def postpone_event
    return @start_date += 86400
  end

 # binding.pry

  def get_end_date
    end_date = @start_date + (@duration * 60)
    puts "End date ---- #{end_date} ----"
  end

  def is_past?
    @start_date < Time.now 
  end

  def is_future?
    @start_date > Time.now
  end

  def is_soon?
    Time.now() - @start_date < 30
  end

  def to_s
    "Date : ----#{@start_date}----\nDuration : #{@duration} minutes\nTitle : #{@title}\nAttendees : #{@attendees.join(", ")}"
  end
end

event = Event.create_event(date: "2019-01-13 09:00", duration: 10, title: "standup quotidien", attendees: ["truc@machin.com", "bidule@chose.fr"])
event.postpone_event
event.get_end_date
puts "Event is due." if event.is_past?
puts "Event starting later." if event.is_future?
puts "Event starting very soon." if event.is_soon?
puts event