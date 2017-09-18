namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    add_creator
  end
end

def make_events
  count = User.count
  298.times do |n|
    event = Event.find(n + 1)
    rand(18).times do |i|
      begin
        user = User.find(rand(count) + 1)
        event.attendees << user if user.name
      rescue
        next
      end
    end
  end
end

def add_creator
  events = Event.all
  events.map do |event|
    begin
    unless event.attendees.include? event.creator
      event.attendees << event.creator
    end
    rescue
      next
    end
  end 
end
