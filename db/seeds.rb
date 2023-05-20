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

Customer.create!([{email: 'pen@gin', password: 'pengin', name: 'ペンギン', profile: 'ペンギンです。よろしくおねがいしま！', customer_id: '1',
                     profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pengin-user.jpg"), filename:"pengin-user.jpg")},
                  {email: 'kame@kiti', password: 'kamekiti', name: 'かめきち', profile: 'かめきちです。よろしくおねがいします！', customer_id: '2',
                     profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kamekiti-user.jpg"), filename:"hiyoko-user.jpg")},
                  {email: 'hiyoko@hiyoko', password: 'hiyoko', name: 'ひよこ', profile: 'ひよこです。よろしくおねがいします！', customer_id: '3',
                     profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/hiyoko-user.jpg"), filename:"hiyoko-user.jpg")},
                  {email: 'tya@tya', password: 'tyatya', name: 'ちゃー', profile: 'ちゃーです。よろしくおねがいします！', customer_id: '4',
                     profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/tya-user.jpg"), filename:"tya-user.jpg")},
                  {email: 'nin@zin', password: 'ninzin', name: 'にんじん', profile: 'にんじんです。よろしくおねがいします！', customer_id: '5',
                     profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ninzin-user.jpg"), filename:"ninzin-user.jpg")},
                  {email: 'rasu@karu', password: 'rasukaru', name: 'らすかる', profile: 'らすかるです。よろしくおねがいします！', customer_id: '6',
                     profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/rasukaru-user.jpg"), filename:"rasukaru-user.jpg")},
               ])




Scene.create([{id: 1, name: '母の日'}, {id: 2, name: '父の日'}, {id: 3, name: '敬老の日'}, {id: 4, name: '誕生日'}, {id: 5, name: '記念日'}, {id: 6, name: '自分ご褒美'}
            ])

GIft.create([{customer_id: 1, scene_id: 1, name: '苺ケーキ', shop_name: 'ながのCAKE', price: 100, introduction: 'test'}])