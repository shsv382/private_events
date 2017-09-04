namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_events
  end
end

def make_events
  count = User.count
  99.times do |n|
    time = Time.new(1980 + rand(50), 1 + rand(11), 1 + rand(30))
    event = Event.create!(name: "#{Faker::Name.job_titles[rand Faker::Name.job_titles.length]}'s day",
                          location: Faker::Address.city,
                          date: time,
                          creator_id: rand(count))
  end
end