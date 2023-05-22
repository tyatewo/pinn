# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
  )

Customer.create!(
   [
      {email: 'pen@gin', password: 'pengin', name: 'ペンギン', profile: 'ペンギンです。よろしくおねがいしま！', customer_id: '1',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/pengin-user.jpg"), filename:"pengin-user.jpg")},
      {email: 'kame@kiti', password: 'kamekiti', name: 'かめきち', profile: 'かめきちです。よろしくおねがいします！', customer_id: '2',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/kamekiti-user.jpg"), filename:"hiyoko-user.jpg")},
      {email: 'hiyoko@hiyoko', password: 'hiyoko', name: 'ひよこ', profile: 'ひよこです。よろしくおねがいします！', customer_id: '3',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/hiyoko-user.jpg"), filename:"hiyoko-user.jpg")},
      {email: 'tya@tya', password: 'tyatya', name: 'ちゃー', profile: 'ちゃーです。よろしくおねがいします！', customer_id: '4',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/tya-user.jpg"), filename:"tya-user.jpg")},
      {email: 'nin@zin', password: 'ninzin', name: 'にんじん', profile: 'にんじんです。よろしくおねがいします！', customer_id: '5',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/ninzin-user.jpg"), filename:"ninzin-user.jpg")},
      {email: 'rasu@karu', password: 'rasukaru', name: 'らすかる', profile: 'らすかるです。よろしくおねがいします！', customer_id: '6',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/rasukaru-user.jpg"), filename:"rasukaru-user.jpg")},
   ]
)


Scene.create(
   [
      {id: 1, name: '母の日'}, {id: 2, name: '父の日'}, {id: 3, name: '敬老の日'}, {id: 4, name: '誕生日'}, {id: 5, name: '記念日'}, {id: 6, name: '自分ご褒美'}
   ]
)


GIft.create(
   [
      {gift_id: 1, customer_id: 1, scene_id: 1, name: '苺ケーキ', shop_name: 'ながのCAKE', price: 1000, tag_name: 'ケーキ,ながのCAKE', introduction: '喜んでもらえた',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/itigocake.jpg"))},
      {gift_id: 2, customer_id: 1, scene_id: 2, name: '日本酒', shop_name: '定〇渓商店', price: 2000, tag_name: 'お酒', introduction: 'とても良かった',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/nihonsyu.jpg"))},
      {gift_id: 3, customer_id: 2, scene_id: 3, name: 'お出汁', shop_name: '久〇福商店', price: 1500, tag_name: '出汁', introduction: '喜んでもらえた',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/dasi.jpg"))},
      {gift_id: 4, customer_id: 2, scene_id: 4, name: 'ディフューザー', shop_name: 'ギフトショップ', price: 1300, tag_name: 'ディフューザー', introduction: 'とてもよかった',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/diffuser.jpg"))},
      {gift_id: 5, customer_id: 3, scene_id: 5, name: '香水', shop_name: 'Shir〇', price: 4000, tag_name: '香水', introduction: '喜んでもらえた',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/kousui.jpg"))},
      {gift_id: 6, customer_id: 3, scene_id: 6, name: '石鹸', shop_name: 'L〇SH', price: 700, tag_name: '石鹸', introduction: '良かった',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/sekkenn.jeg"))},
      {gift_id: 7, customer_id: 4, scene_id: 1, name: 'ドライフラワー', shop_name: 'フラワーショップ', price: 1300, tag_name: '花', introduction: 'とても良かった',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/hana.jpg"))},
      {gift_id: 8, customer_id: 4, scene_id: 2, name: 'ココアケーキ', shop_name: 'ながのCAKE', price: 700, tag_name: 'ケーキ,ながのCAKE', introduction: '喜んでもらえた',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/cocoacake.jpg"))},
      {gift_id: 9, customer_id: 5, scene_id: 3, name: 'チョコレート', shop_name: '〇〇製菓', price: 1300, tag_name: 'チョコレート', introduction: '喜んでもらえた',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/choco.jpg"))},
      {gift_id: 10, customer_id: 5, scene_id: 4, name: 'プリン', shop_name: 'ながのCAKE', price: 300, tag_name: 'プリン,ながのCAKE', introduction: '喜んでもらえた',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/purin.jpg"))},
      {gift_id: 11, customer_id: 5, scene_id: 5, name: 'クッキー', shop_name: 'ながのCAKE', price: 300, tag_name: 'クッキー,ながのCAKE', introduction: '喜んでもらえた',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/cookie.jpg"))},
      {gift_id: 12, customer_id: 5, scene_id: 6, name: 'ハーバリウム', shop_name: 'ギフトショップ', price: 700, tag_name: '花', introduction: '良かった',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/herbarium.jpg"))},
      {gift_id: 13, customer_id: 5, scene_id: 1, name: 'カボチャムース', shop_name: '〇〇製菓', price: 300, tag_name: 'かぼちゃ', introduction: '良かった',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/kabotya.jpg"))},
      {gift_id: 14, customer_id: 5, scene_id: 1, name: 'ミックスナッツ', shop_name: '〇〇製菓', price: 300, tag_name: 'ナッツ', introduction: '喜んでもらえた',
               profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/nattu.jpg"))},
   ]
)


Comment.create(
   [
      {customer_id: 1, gift_id: 14, body: 'いいですね'},
      {customer_id: 1, gift_id: 13, body: 'いいですね'},
      {customer_id: 2, gift_id: 12, body: '参考にします'},
      {customer_id: 2, gift_id: 11, body: '参考にします'},
      {customer_id: 3, gift_id: 10, body: 'すてきですね'},
      {customer_id: 3, gift_id: 9, body: 'すてきですね'},
      {customer_id: 4, gift_id: 8, body: 'いいですね'},
      {customer_id: 4, gift_id: 7, body: 'いいですね'},
      {customer_id: 5, gift_id: 6, body: '使ってみます'},
      {customer_id: 5, gift_id: 5, body: '使ってみます'},
      {customer_id: 6, gift_id: 4, body: 'いいですね'},
      {customer_id: 6, gift_id: 3, body: 'いいですね'},
      {customer_id: 6, gift_id: 2, body: '参考にします'},
      {customer_id: 6, gift_id: 1, body: '参考にします'},

   ]
)


Bookmark.create(
   [
      {customer_id: 1, gift_id: 14},
      {customer_id: 1, gift_id: 12},
      {customer_id: 1, gift_id: 10},
      {customer_id: 3, gift_id: 8},
      {customer_id: 3, gift_id: 6},
      {customer_id: 3, gift_id: 4},
      {customer_id: 5, gift_id: 2},
      {customer_id: 5, gift_id: 13},
      {customer_id: 5, gift_id: 11},
      {customer_id: 6, gift_id: 9},
      {customer_id: 6, gift_id: 7},
      {customer_id: 6, gift_id: 5},
      {customer_id: 6, gift_id: 3},
      {customer_id: 2, gift_id: 6},
      {customer_id: 2, gift_id: 7},
      {customer_id: 4, gift_id: 8},
      {customer_id: 4, gift_id: 9},
   ]
)