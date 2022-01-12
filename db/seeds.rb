# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ username: 'ethan'}, { username: 'shawn'}, { username: 'bob'}])

artworks = Artwork.create([{title: 'Starry Night', image_url: 'star.com', artist_id: 1},
    {title: 'Doggo', image_url: 'dog.com', artist_id: 2},
    {title: "Bob's Burgers", image_url: 'burger.com', artist_id: 3}])

artwork_shares = ArtworkShare.create([{artwork_id: 1, viewer_id: 2},
    {artwork_id: 2, viewer_id: 3},
    {artwork_id: 3, viewer_id: 1}])

comments = Comment.create([{user_id: 1, artwork_id: 2, body: "Wow looks great!"},
 {user_id: 2, artwork_id: 3, body: "Picasso!"}, 
 {user_id: 3, artwork_id: 1, body: "Exquisite"}])