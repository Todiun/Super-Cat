# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Cat.destroy_all
User.destroy_all
CatOwnership.destroy_all

user_count = 10
cat_count = 30
ownership_count = 60

puts "Creating #{user_count} users"
user_count.times do
    username = Faker::Name.name
    User.create(
        email: "#{username.split.join(".")}@yopmail.com",
        password: "coolos"
    )
end

puts "Creating #{cat_count} cats"

cat_count.times do
    catname = Faker::ProgrammingLanguage.name
    Cat.create(
        name: catname,
        race: Faker::Books::Lovecraft.deity,
        description: Faker::Books::Lovecraft.paragraph
    )
end

puts "Giving free cats to users"
ownership_count.times do
    CatOwnership.create(
        user_id: rand(User.first.id..User.last.id),
        cat_id: rand(Cat.first.id..Cat.last.id)
    )
end

puts "Giving users opinions about cats"
for own in CatOwnership.all do
    u = own.user
    c = own.cat
    Comment.create(
        cat_id: c.id,
        user_id: u.id,
        content: Faker::Quotes::Shakespeare.as_you_like_it_quote
    )
end