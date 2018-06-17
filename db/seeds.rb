# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Parent.delete_all
Task.delete_all
User.delete_all

Parent.create!(email: 'bi4hiji@mail.ru', password:'123123123',
               full_name: 'Serhii Bichkhidzhy', balance: 100)

User.create!(email: 'bi4hiji@mail.ru', password:'123123123', parent_id: 1,
             full_name: 'Val`demar Bichkhidzhy', balance: 0)

5.times do |i|
Task.create!(title: 'Title of task', reward: i*2, user_id: 1, assigned: true,
             description: 'very-very-very-very-very-very-very-very-very-very-very-very long deskription',
             parent_id: 1, status: 'open',  paid: false)
end
