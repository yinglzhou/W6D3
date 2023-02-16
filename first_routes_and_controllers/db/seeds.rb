# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.transaction do
  puts "Preparing #{Rails.env} environment"

  puts "Destroying tables..."
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  puts "Resetting id sequences..."
  %w(users artworks artwork_shares).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  puts "Creating seed data..."
  tim = User.create!(
    username: "tim",
  )

  ying = User.create!(
    username: "ying",
  )

  shan = User.create!(
    username: "shan",
  )

  gary = User.create!(
    username: "gary",
  )

  city = Artwork.create!(
    title: "city",
    image_url: "cracked.org",
    artist_id: 1,
  )

  monalisa = Artwork.create!(
    title: "mona lisa",
    image_url: "monalisa.org",
    artist_id: 2,
  )

  starrynight = Artwork.create!(
    title: "starrynight",
    image_url: "starry.com",
    artist_id: 2,
  )

  mirror1 = Artwork.create!(
    title: "the mirror",
    image_url: "self.com",
    artist_id: 4,
  )

  mirror2 = Artwork.create!(
    title: "the mirror",
    image_url: "selfy.com",
    artist_id: 2,
  )

  view1 = ArtworkShare.create!(
    artwork_id: 3,
    viewer_id: 4,
  )

  view2 = ArtworkShare.create!(
    artwork_id: 3,
    viewer_id: 3,
  )
  puts "Done with #{Rails.env} environment!"
end
