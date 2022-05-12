# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seed.rb
puts "Seeding..."


count_of_users_start = 0
count_of_users_fin = 100

count_of_posts_start = 0
count_of_posts_fin = 200000

while count_of_users_start < count_of_users_fin  do
   User.create(login: "user" + count_of_users_start.to_s)

   count_of_users_start +=1
end

while count_of_posts_start < count_of_posts_fin  do
  Post.create(title: "title" + count_of_posts_start.to_s, body: "body" + count_of_posts_start.to_s, author_ip: "127.0.0." + rand(0..256).to_s, user_id: rand(1..100)) 

  count_of_posts_start +=1
end

puts "Seeding done."