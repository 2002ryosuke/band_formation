# seeds.rb

# Create Users
users = [
  { name: "Alice", email: "alice@example.com", password: "password", status: 0 },
  { name: "Bob", email: "bob@example.com", password: "password", status: 1 },
  { name: "Charlie", email: "charlie@example.com", password: "password", status: 0 },
  { name: "David", email: "david@example.com", password: "password", status: 0 }
]

users.each do |user_data|
  User.find_or_create_by!(email: user_data[:email]) do |user|
    user.name = user_data[:name]
    user.password = user_data[:password]
    user.password_confirmation = user_data[:password] # Important for Devise if used
    user.status = user_data[:status]
  end
end

puts "Created #{User.count} users"

# Create Categories
categories = [
  { name: "Rock" },
  { name: "Pop" },
  { name: "Jazz" },
  { name: "Metal" },
  { name: "Blues" }
]

categories.each do |category_data|
  Category.find_or_create_by!(name: category_data[:name])
end

puts "Created #{Category.count} categories"

# Create Events
events = [
  { name: "Summer Fest", day: DateTime.new(2024, 8, 10), place: "Central Park", min_bans: 3, max_bans: 5, comment: "Annual summer music festival", user: User.first },
  { name: "Indie Showcase", day: DateTime.new(2024, 9, 15), place: "The Roxy", min_bans: 2, max_bans: 4, comment: "Showcasing local indie bands", user: User.second },
  { name: "Jazz Night", day: DateTime.new(2024, 10, 20), place: "Blue Note Club", min_bans: 1, max_bans: 3, comment: "Evening of classic jazz", user: User.first }
]

events.each do |event_data|
  Event.find_or_create_by!(name: event_data[:name]) do |event|
    event.day = event_data[:day]
    event.place = event_data[:place]
    event.min_bans = event_data[:min_bans]
    event.max_bans = event_data[:max_bans]
    event.comment = event_data[:comment]
    event.user = event_data[:user]
    event.random_number = SecureRandom.hex(10)
  end
end

puts "Created #{Event.count} events"

# Create EventUsers (Join Table)
event_users = [
  { event: Event.first, user: User.first, participated_at: DateTime.new(2024, 8, 9), status: 1}, # Example status
  { event: Event.first, user: User.second, participated_at: DateTime.new(2024, 8, 9), status: 0},
  { event: Event.second, user: User.third, participated_at: DateTime.new(2024, 9, 14), status: 1},
  { event: Event.third, user: User.first, participated_at: DateTime.new(2024, 10, 19), status: 0}
]

# event_users.each do |event_user_data|
#   EventUser.find_or_create_by!(event: event_user_data[:event], user: event_user_data[:user]) do |event_user|
#     event_user.participated_at = event_user_data[:participated_at]
#     event_user.status = event_user_data[:status]
#   end
# end

puts "Created #{EventUser.count} event users"

# Create Band Requests
band_requests = [
  { name: "The Rockers", music_name: "Highway Star", playing_time: 30, my_category: Category.find_by(name: "Rock"), recruting_category: Category.find_by(name: "Pop"), count: 4, comment: "Looking for a drummer", recruiting_user: User.third, user: User.first, event: Event.first },
  { name: "Jazz Masters", music_name: "Take Five", playing_time: 45, my_category: Category.find_by(name: "Jazz"), recruting_category: Category.find_by(name: "Jazz"), count: 3, comment: "Experienced jazz trio", recruiting_user: User.first, user: User.second, event: Event.second },
  { name: "Metal Mayhem", music_name: "Ironclad", playing_time: 35, my_category: Category.find_by(name: "Metal"), recruting_category: Category.find_by(name: "Rock"), count: 5, comment: "Brutal metal band looking for gigs", recruiting_user: User.second, user: User.third, event: Event.first }
]

band_requests.each do |band_request_data|
  BandRequest.find_or_create_by!(name: band_request_data[:name]) do |band_request|
    band_request.music_name = band_request_data[:music_name]
    band_request.playing_time = band_request_data[:playing_time]
    band_request.my_category = band_request_data[:my_category]
    band_request.recruting_category = band_request_data[:recruting_category]
    band_request.count = band_request_data[:count]
    band_request.comment = band_request_data[:comment]
    band_request.recruiting_user = band_request_data[:recruiting_user]
    band_request.user = band_request_data[:user]
    band_request.event = band_request_data[:event]
  end
end

puts "Created #{BandRequest.count} band requests"