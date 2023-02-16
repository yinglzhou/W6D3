# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    inverse_of: :artist,
    dependent: :destroy

  has_many :viewers,
    foreign_key: :viewers_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artworks,
    source: :artworks
end

# = Artwork.new(title:' ', image_url: ' ' , artist_id: ' ')
