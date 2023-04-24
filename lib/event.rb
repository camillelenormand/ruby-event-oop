require 'time'
require 'pry'

class Event
  attr_accessor :start_date, :attendees, :duration, :title

  def initialize(start_date:, duration:, attendees:, title:)
    @start_date = Time.parse(start_date) #parse the start date to Time object
    @duration = duration #duration of the event
    @title = title #title of the event
    @attendees = attendees #attendees of the event
  end

  def self.create_event(date:, duration:, attendees:, title:)
    Event.new(start_date: date, duration: duration, attendees: attendees, title: title) #create a new event object
  end

  def postpone_event
    return @start_date += 86400 #postpone the event by one day
  end

  def get_end_date
    end_date = @start_date + (@duration * 60) #calculate the end date of the event
    puts "End date ---- #{end_date} ----" #print the end date of the event
  end

  def is_past?
    @start_date < Time.now #check if the event is in the past
  end

  def is_future?
    @start_date > Time.now #check if the event is in the future
  end

  def is_soon?
    Time.now() - @start_date < 30 #check if the event is starting soon
  end

  def to_s
    "Date : ----#{@start_date}----\nDuration : #{@duration} minutes\nTitle : #{@title}\nAttendees : #{@attendees.join(", ")}" #return the event details as a string
  end
end

event = Event.create_event(date: "2019-01-13 09:00", duration: 10, title: "standup quotidien", attendees: ["truc@machin.com", "bidule@chose.fr"]) #create a new event object
event.postpone_event #postpone the event by one day
event.get_end_date #print the end date of the event
puts "Event is due." if event.is_past? #check if the event is in the past and print a message
puts "Event starting later." if event.is_future? #check if the event is in the future and print a message
puts "Event starting very soon." if event.is_soon? #check if the event is starting soon and print a message
puts event #print the event details
