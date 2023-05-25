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
      {email: 'pen@gin', password: 'pengin', name: 'ペンギン', profile: 'ペンギンです。よろしくおねがいしま！', id: '1',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/pengin-user.jpg"), filename:"pengin-user.jpg")},
      {email: 'kame@kiti', password: 'kamekiti', name: 'かめきち', profile: 'かめきちです。よろしくおねがいします！', id: '2',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/kamekiti-user.jpg"), filename:"hiyoko-user.jpg")},
      {email: 'hiyoko@hiyoko', password: 'hiyoko', name: 'ひよこ', profile: 'ひよこです。よろしくおねがいします！', id: '3',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/hiyoko-user.jpg"), filename:"hiyoko-user.jpg")},
      {email: 'tya@tya', password: 'tyatya', name: 'ちゃー', profile: 'ちゃーです。よろしくおねがいします！', id: '4',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/tya-user.jpg"), filename:"tya-user.jpg")},
      {email: 'nin@zin', password: 'ninzin', name: 'にんじん', profile: 'にんじんです。よろしくおねがいします！', id: '5',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/ninzin-user.jpg"), filename:"ninzin-user.jpg")},
      {email: 'rasu@karu', password: 'rasukaru', name: 'らすかる', profile: 'らすかるです。よろしくおねがいします！', id: '6',
         profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/customers/rasukaru-user.jpg"), filename:"rasukaru-user.jpg")},
   ]
)


Scene.create(
   [
      {id: 1, name: '母の日'}, {id: 2, name: '父の日'}, {id: 3, name: '敬老の日'}, {id: 4, name: '誕生日'}, {id: 5, name: '記念日'}, {id: 6, name: '自分ご褒美'}
   ]
)


Gift.create(
   [
      {id: 1, customer_id: 1, scene_id: 1, name: '苺ケーキ', shop_name: 'ながのCAKE', price: 1000, introduction: '喜んでもらえた',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/itigocake.jpg"),filename: 'itigocake.jpg')},
      {id: 2, customer_id: 1, scene_id: 2, name: '日本酒', shop_name: '定〇渓商店', price: 2000, introduction: 'とても良かった',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/nihonsyu.jpg"),filename: 'nihonsyu.jpg')},
      {id: 3, customer_id: 2, scene_id: 3, name: 'お出汁', shop_name: '久〇福商店', price: 1500, introduction: '喜んでもらえた',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/dasi.jpg"),filename: 'dasi.jpg')},
      {id: 4, customer_id: 2, scene_id: 4, name: 'ディフューザー', shop_name: 'ギフトショップ', price: 1300, introduction: 'とてもよかった',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/diffuser.jpg"),filename: 'diffuser.jpg')},
      {id: 5, customer_id: 3, scene_id: 5, name: '香水', shop_name: 'Shir〇', price: 4000, introduction: '喜んでもらえた',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/kousui.jpg"),filename: 'kousui.jpg')},
      {id: 6, customer_id: 3, scene_id: 6, name: '石鹸', shop_name: 'L〇SH', price: 700, introduction: '良かった',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/sekkenn.jeg"),filename: 'sekkenn.jeg')},
      {id: 7, customer_id: 4, scene_id: 1, name: 'ドライフラワー', shop_name: 'フラワーショップ', price: 1300, introduction: 'とても良かった',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/hana.jpg"),filename: 'hana.jpg')},
      {id: 8, customer_id: 4, scene_id: 2, name: 'ココアケーキ', shop_name: 'ながのCAKE', price: 700, introduction: '喜んでもらえた',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/cocoacake.jpg"),filename: 'cocoacake.jpg')},
      {id: 9, customer_id: 5, scene_id: 3, name: 'チョコレート', shop_name: '石〇製菓', price: 1300, introduction: '喜んでもらえた',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/choco.jpg"),filename: 'choco.jpg')},
      {id: 10, customer_id: 5, scene_id: 4, name: 'プリン', shop_name: 'ながのCAKE', price: 300, introduction: '喜んでもらえた',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/purin.jpg"),filename: 'purin.jpg')},
      {id: 11, customer_id: 5, scene_id: 5, name: 'クッキー', shop_name: 'ながのCAKE', price: 300, introduction: '喜んでもらえた',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/cookie.jpg"),filename: 'cookie.jpg')},
      {id: 12, customer_id: 5, scene_id: 6, name: 'ハーバリウム', shop_name: 'ギフトショップ', price: 700, introduction: '良かった',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/herbarium.jpg"),filename: 'herbarium.jpg')},
      {id: 13, customer_id: 5, scene_id: 1, name: 'カボチャムース', shop_name: '石〇製菓', price: 300, introduction: '良かった',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/kabotya.jpg"),filename: 'kabotya.jpg')},
      {id: 14, customer_id: 5, scene_id: 1, name: 'ミックスナッツ', shop_name: '石〇製菓', price: 300, introduction: '喜んでもらえた',
               gift_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gifts/nattu.jpg"),filename: 'nattu.jpg')},
   ]
)


Tag.create!(
   [
      {id: 1, name: 'ケーキ'},
      {id: 2, name: 'ながのCAKE'},
      {id: 3, name: 'お酒'},
      {id: 4, name: '出汁'},
      {id: 5, name: 'ディフューザー'},
      {id: 6, name: '香水'},
      {id: 7, name: '石鹸'},
      {id: 8, name: '花'},
      {id: 9, name: 'チョコレート'},
      {id: 10, name: 'プリン'},
      {id: 11, name: 'クッキー'},
      {id: 12, name: 'ナッツ'},
   ]
)

GiftTag.create!(
   [
      {id: 1, tag_id: 1, gift_id: 1},
      {id: 2, tag_id: 2, gift_id: 1},
      {id: 3, tag_id: 3, gift_id: 2},
      {id: 4, tag_id: 4, gift_id: 3},
      {id: 5, tag_id: 5, gift_id: 4},
      {id: 6, tag_id: 6, gift_id: 5},
      {id: 7, tag_id: 7, gift_id: 6},
      {id: 8, tag_id: 8, gift_id: 7},
      {id: 9, tag_id: 1, gift_id: 8},
      {id: 10, tag_id: 2, gift_id: 8},
      {id: 11, tag_id: 9, gift_id: 9},
      {id: 12, tag_id: 2, gift_id: 10},
      {id: 12, tag_id: 10, gift_id: 10},
      {id: 13, tag_id: 2, gift_id: 11},
      {id: 13, tag_id: 11, gift_id: 11},
      {id: 14, tag_id: 8, gift_id: 12},
      {id: 15, tag_id: 1, gift_id: 13},
      {id: 16, tag_id: 12, gift_id: 14},

   ]
)




Comment.create(
   [
      {id:1, customer_id: 1, gift_id: 14, body: 'いいですね'},
      {id:2, customer_id: 1, gift_id: 13, body: 'いいですね'},
      {id:3, customer_id: 2, gift_id: 12, body: '参考にします'},
      {id:4, customer_id: 2, gift_id: 11, body: '参考にします'},
      {id:5, customer_id: 3, gift_id: 10, body: 'すてきですね'},
      {id:6, customer_id: 3, gift_id: 9, body: 'すてきですね'},
      {id:7, customer_id: 4, gift_id: 8, body: 'いいですね'},
      {id:8, customer_id: 4, gift_id: 7, body: 'いいですね'},
      {id:9, customer_id: 5, gift_id: 6, body: '使ってみます'},
      {id:10, customer_id: 5, gift_id: 5, body: '使ってみます'},
      {id:11, customer_id: 6, gift_id: 4, body: 'いいですね'},
      {id:12, customer_id: 6, gift_id: 3, body: 'いいですね'},
      {id:13, customer_id: 6, gift_id: 2, body: '参考にします'},
      {id:14, customer_id: 6, gift_id: 1, body: '参考にします'},

   ]
)


Bookmark.create(
   [
      {id:1, customer_id: 1, gift_id: 8},
      {id:2, customer_id: 1, gift_id: 12},
      {id:3, customer_id: 1, gift_id: 10},
      {id:4, customer_id: 3, gift_id: 8},
      {id:5, customer_id: 3, gift_id: 6},
      {id:6, customer_id: 3, gift_id: 4},
      {id:7, customer_id: 5, gift_id: 2},
      {id:8, customer_id: 5, gift_id: 13},
      {id:9, customer_id: 5, gift_id: 8},
      {id:10, customer_id: 6, gift_id: 9},
      {id:11, customer_id: 6, gift_id: 7},
      {id:12, customer_id: 6, gift_id: 5},
      {id:13, customer_id: 6, gift_id: 3},
      {id:14, customer_id: 2, gift_id: 6},
      {id:15, customer_id: 2, gift_id: 7},
      {id:16, customer_id: 4, gift_id: 8},
      {id:17, customer_id: 4, gift_id: 9},
   ]
)