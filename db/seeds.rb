# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  
    User.create!(name:  "test01",
                 email: "test01@exapmle.com",
                 password:              "000000",
                 password_confirmation: "000000",
                 balance: 0.0,
                 activated: true,
                 activated_at: Time.zone.now)
    User.create!(name:  "test02",
                email: "test02@exapmle.com",
                password:              "000000",
                password_confirmation: "000000",
                balance: 0.0,
                activated: true,
                activated_at: Time.zone.now)
    User.create!(name:  "test03",
                email: "test03@exapmle.com",
                password:              "000000",
                password_confirmation: "000000",
                balance: 0.0,
                activated: true,
                activated_at: Time.zone.now)
  end
  