# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Cart.destroy_all # Pas de chat ajouté au panier par défaut
Cat.destroy_all
User.destroy_all
CatOwnership.destroy_all

user_count = 10
cat_count = 20
ownership_count = 50

cat_breeds = [
  "Abyssinian",
  "Bengal",
  "Maine Coon",
  "Persian",
  "Siamese",
  "Ragdoll",
  "Sphynx",
  "British Shorthair",
  "Scottish Fold",
  "Russian Blue",
  "Burmese",
  "Norwegian Forest Cat",
  "Siberian",
  "Birman",
  "Oriental Shorthair",
  "Devon Rex",
  "Cornish Rex",
  "Exotic Shorthair",
  "Japanese Bobtail",
  "Egyptian Mau"
]

cat_descriptions = [
  "Active, energetic, and playful. Known for their ticked coat and love of climbing.",
  "Wild appearance with spotted or marbled coats. Highly energetic and intelligent.",
  "One of the largest domestic cat breeds. Friendly, gentle, and known for their tufted ears and bushy tails.",
  "Long, luxurious coat and calm demeanor. Sweet-natured and enjoys a relaxed environment.",
  "Sleek, vocal, and social. Known for their striking blue eyes and color-pointed coat.",
  "Large, affectionate, and docile. Known for going limp when picked up, hence the name.",
  "Hairless breed with a playful and extroverted personality. Loves attention and warmth.",
  "Compact and muscular with a dense coat. Calm, easygoing, and affectionate.",
  "Known for their folded ears and round face. Sweet-natured and playful.",
  "Elegant, short coat with a shimmering silver-blue appearance. Gentle and reserved.",
  "People-oriented, affectionate, and playful. Known for their muscular build and expressive eyes.",
  "Long-haired, sturdy breed with a friendly and calm personality. Loves outdoor activities.",
  "Strong, agile, and known for their thick triple coat. Playful and affectionate.",
  "Sacred cat of Burma. Known for their silky coat, blue eyes, and gentle nature.",
  "Slender, athletic, and vocal. Comes in a variety of colors and patterns.",
  "Playful, mischievous, and known for their wavy coat and large ears.",
  "Similar to the Devon Rex but with a curlier coat. Energetic and affectionate.",
  "Short-haired version of the Persian. Calm, easygoing, and affectionate.",
  "Known for their short tail and playful, vocal nature. Considered lucky in Japan.",
  "Athletic, intelligent, and known for their spotted coat. One of the oldest domesticated breeds."
]

cat_names = [
  "Luna",
  "Simba",
  "Chloe",
  "Milo",
  "Léo",
  "Bella",
  "Felix",
  "Lola",
  "Max",
  "Nala",
  "Oliver",
  "Misty",
  "Tiger",
  "Zoé",
  "Gizmo",
  "Coco",
  "Smoky",
  "Mia",
  "Pacha",
  "Kitty",
  "Jasmin",
  "Rocky",
  "Lily",
  "Théo",
  "Milo",
  "Pepette",
  "Minou",
  "Tigresse",
  "Moustache",
  "Pirate"
]

user_comments_on_cats = [
  "So happy with my new furry friend! Adjusted to our home instantly and brought so much joy.",
  "Incredibly affectionate—loves curling up next to me every evening while I watch TV.",
  "Such a little goofball! Always getting into mischief, but it just makes us laugh every day.",
  "Didn’t expect such a social cat—greets me at the door every time I come home from work.",
  "Completely transformed our home. It’s amazing how loving and smart this little one is.",
  "A total sweetheart—always sleeps right next to me at night.",
  "Playful and full of energy, but also knows when to cuddle. Perfect balance!",
  "The best decision we made. Brings so much warmth and happiness to our family.",
  "Surprised by how quickly this one learned the household routine. Feels like a part of the family already.",
  "Couldn’t ask for a better companion. Always there to cheer me up after a long day."
]

puts "Creating #{user_count} users"
user_count.times do
    username = Faker::Name.name
    User.create(
        email: "#{username.split.join(".")}@yopmail.com",
        password: "coolos"
    )
end

puts "Creating #{cat_count} cats"

cat_number = 1
cat_count.times do
    Cat.create(
        name: cat_names[rand(0..(cat_names.length - 1))],
        race: cat_breeds[rand(0..(cat_breeds.length - 1))],
        description: cat_descriptions[rand(0..(cat_descriptions.length - 1))],
        cat_image: "cat_images/cat#{cat_number}.jpg",
        price_cents: rand(500..5000)
    )
    cat_number +=1
    if cat_number > 20 # comme on a que 20 images de chats au cas où on veut plus que 20 chats, ça repart depuis la premiere image
        cat_number = 1
    end
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
        content: user_comments_on_cats[rand(0..(user_comments_on_cats.length - 1))]
    )
end
