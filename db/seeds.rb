# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end


yamada = User.find_or_create_by!(email: "yamada@example.com") do |user|
  user.name = "Yamada"
  user.password = "yamadauser1"
  user.profile_avatar = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")
end

kimura = User.find_or_create_by!(email: "kimura@example.com") do |user|
  user.name = "Kimura"
  user.password = "kimurauser2"
  user.profile_avatar = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
end

satou = User.find_or_create_by!(email: "satou@example.com") do |user|
  user.name = "Satou"
  user.password = "satouuser3"
  user.profile_avatar = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
end

genre1 = Genre.find_or_create_by!(genre_name: "RPG") do |genre|
end

genre2 = Genre.find_or_create_by!(genre_name: "カード＆パズル") do |genre|
end

genre3 = Genre.find_or_create_by!(genre_name: "シューティング") do |genre|
end

genre4 = Genre.find_or_create_by!(genre_name: "格闘") do |genre|
end

genre5 = Genre.find_or_create_by!(genre_name: "スポーツ") do |genre|
end

game1 = Game.find_or_create_by!(name: "〇〇の大冒険") do |game|
  game.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game1.png"), filename:"sample-game1.png")
  game.introduction = "魔王を倒して世界の平和を目指すロールプレイングゲームです。"
  game.genre_id = genre1.id
  game.price = "0"
end

game2 = Game.find_or_create_by!(name: "〇〇カードバトル") do |game|
  game.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game2.png"), filename:"sample-game2.png")
  game.introduction = "色々な能力のカードを使い勝利を目指すデジタルカードゲームです。"
  game.genre_id = genre2.id
  game.price = "250"
end

game3 = Game.find_or_create_by!(name: "〇〇レジェンズ") do |game|
  game.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game3.png"), filename:"sample-game3.png")
  game.introduction = "3人チームで生き残りを目指すファーストパーソンシューティングゲームです。"
  game.genre_id = genre3.id
  game.price = "1500"
end

game4 = Game.find_or_create_by!(name: "〇〇ファイターズ") do |game|
  game.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game4.png"), filename:"sample-game4.png")
  game.introduction = "特徴的なファイターを選び１対１で戦う格闘ゲームです。"
  game.genre_id = genre4.id
  game.price = "4500"
end

game5 = Game.find_or_create_by!(name: "〇〇サッカー") do |game|
  game.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-game5.png"), filename:"sample-game5.png")
  game.introduction = "理想のサッカーチームを作り優勝を目指すスポーツゲームです。"
  game.genre_id = genre5.id
  game.price = "6000"
end

review1 = Review.find_or_create_by!(user_id: yamada.id, game_id: game1.id) do |review|
  review.review_writing = "7~10時間ほどでクリアできる丁度いいボリュームのゲームです。"
end

review2 = Review.find_or_create_by!(user_id: kimura.id, game_id: game1.id) do |review|
  review.review_writing = "10~15時間ほどでクリアできる丁度いいボリュームのゲームです。"
end

review3 = Review.find_or_create_by!(user_id: yamada.id, game_id: game2.id) do |review|
  review.review_writing = "追記：どこでもセーブできてやり直せるので慣れてない人でも遊びやすいです。"
end

Comment.find_or_create_by!(user_id: kimura.id, review_id: review2.id) do |comment|
  comment.comment_writing = "なるほど参考になります＠＠＠"
end

Comment.find_or_create_by!(user_id: kimura.id, review_id: review3.id) do |comment|
  comment.comment_writing = "訂正：なるほど参考になります。"
end
