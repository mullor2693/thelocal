# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # User.create(email: "test@test.com", password: "password", name: "Test", surname: "Testing More", birth_date: (Date.today - 28.years), sex: 1, phone: "921876543")
  # 10.times { 
  #   name = Faker::Name.first_name
  #   surname = Faker::Name.last_name
  #   full_name = [(name.try(:strip) || ""), (surname.try(:strip) || "")].join(" ").strip
  #   birth_date = Faker::Date.birthday(min_age: 14, max_age: 65)
  #   phone = Faker::PhoneNumber.cell_phone
  #   email = Faker::Internet.email(name: full_name, separators: '.', domain: 'test.com')
  #   sex = rand(0..2)

  #   User.create(email: email, password: "password", name: name, surname: surname, birth_date: birth_date, phone: phone, sex: sex)
  # }
  # 10.times { 
  #   room_params = {}
  #   room_params[:name] = Faker::House.unique.room
  #   room_params[:description] = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 3)
  #   Room.create(room_params)
  # }

Rake::Task['exercises:create_initials'].invoke
Rake::Task['foods:create_initials'].invoke
Rake::Task['roles:create_initials'].invoke
Rake::Task['users:create_initials'].invoke