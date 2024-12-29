# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# ユーザーの作成
user1 = User.create!(name: "User 1", email: "user1@example.com", password: "password", password_confirmation: "password")
user2 = User.create!(name: "User 2", email: "user2@example.com", password: "password", password_confirmation: "password")

# カテゴリの作成
category1 = Category.create!(name: "Rock")
category2 = Category.create!(name: "Pop")
category3 = Category.create!(name: "Jazz")

# イベントの作成
event1 = Event.create!(name: "Summer Festival", day: Date.new(2024, 8, 10), place: "Park", min_bans: 3, max_bans: 5, user: user1)
event2 = Event.create!(name: "Autumn Live", day: Date.new(2024, 11, 15), place: "Hall", min_bans: 2, max_bans: 3, user: user2)

# バンドリクエストの作成
BandRequest.create!(name: "Band A", music_name: "Song X", playing_time: 30, count: 4, user: user1, event: event1, my_category: category1, recruting_category: category2, recruiting_user: user2, comment: "Looking for a drummer.")
BandRequest.create!(name: "Band B", music_name: "Song Y", playing_time: 45, count: 3, user: user2, event: event2, my_category: category3, comment: "Need a guitarist.")

puts "Seeds created successfully!"