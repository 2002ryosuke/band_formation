# db/seeds.rb

# ユーザーの作成
User.create!(name: "管理者1", email: "admin1@example.com", password: "password", password_confirmation: "password", status: 1) # status 1は管理者とする
User.create!(name: "ユーザー1", email: "user1@example.com", password: "password", password_confirmation: "password")
User.create!(name: "ユーザー2", email: "user2@example.com", password: "password", password_confirmation: "password")

# カテゴリ（楽器の種類）の作成
categories = [
  { name: "ギター" },
  { name: "ベース" },
  { name: "ドラム" },
  { name: "ボーカル" },
  { name: "キーボード" },
  { name: "その他" }
]
Category.create!(categories)

# イベントの作成 (ユーザー1が主催)
event1 = Event.create!(
  name: "夏祭りライブ",
  day: DateTime.new(2024, 8, 10, 18, 0, 0),
  place: "市民広場",
  min_bans: 3,
  max_bans: 5,
  comment: "夏祭りを盛り上げよう！",
  user_id: User.find_by(email: "user1@example.com").id,
  random_number: SecureRandom.hex(10)
)

event2 = Event.create!(
  name: "秋の音楽祭",
  day: DateTime.new(2024, 10, 20, 15, 0, 0),
  place: "文化センター",
  min_bans: 2,
  max_bans: 4,
  comment: "秋の夜長に音楽を楽しもう！",
  user_id: User.find_by(email: "user1@example.com").id,
  random_number: SecureRandom.hex(10)
)


# バンド募集の作成 (ユーザー2がイベント1に対して募集)
band_request1 = BandRequest.create!(
  name: "ロックバンド募集",
  music_name: "オリジナル曲",
  playing_time: 30,
  my_category_id: Category.find_by(name: "ギター").id,
  recruting_category_id: Category.find_by(name: "ボーカル").id,
  count: 1,
  comment: "ボーカル募集！経験者歓迎！",
  user_id: User.find_by(email: "user2@example.com").id,
  event_id: event1.id
)

band_request2 = BandRequest.create!(
  name: "アコースティックバンド募集",
  music_name: "カバー曲",
  playing_time: 45,
  my_category_id: Category.find_by(name: "ギター").id,
  recruting_category_id: Category.find_by(name: "ベース").id,
  count: 1,
  comment: "アコースティックギター、ベース募集！",
  user_id: User.find_by(email: "user2@example.com").id,
  event_id: event2.id
)

# イベント参加 (ユーザー1がイベント1に参加)
EventUser.create!(
  event_id: event1.id,
  user_id: User.find_by(email: "user1@example.com").id,
  participated_at: DateTime.now, #参加日時
  status: 1 # 参加
)

#参加リクエスト(ユーザー1がband_request1に参加リクエスト)
ParticipationRequsest.create!(
  category_id: Category.find_by(name: "ギター").id,
  comment: "参加希望です！",
  user_id: User.find_by(email: "user1@example.com").id,
  band_request_id: band_request1.id
)

puts "Seeds created!"