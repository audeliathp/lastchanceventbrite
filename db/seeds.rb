require 'faker'

User.destroy_all
User.reset_pk_sequence
Attendance.destroy_all
Attendance.reset_pk_sequence
Event.destroy_all
Event.reset_pk_sequence


Faker::Config.locale = 'fr'

users = Array.new
events = Array.new


25.times do 
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    encrypted_password: "Azerty",
    description: Faker::Lorem.sentence,
    email: (Faker::Name.last_name + "@yopmail.com").to_s
  )


  users << user
  puts "Seeding User #{user.first_name} #{user.last_name}"
end

20.times do
  event = Event.create(
    start_date: Faker::Time.between(from: DateTime.now + 10, to: DateTime.now + 5000, format: :short),
    duration: rand(5..100)*5,
    description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: false),
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::TvShows::Suits.quote,
    host_id: User.all.sample.id
  )
  events << event
  puts "Seeding Event #{event.title}"
end

50.times do 
  attendance = Attendance.create(
    guest_id: User.all.sample.id,
    event_id: Event.all.sample.id
  )
  puts "Seeding attendance"
end



