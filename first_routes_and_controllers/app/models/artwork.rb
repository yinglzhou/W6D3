# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :image_url, uniqueness: true, presence: true
  validates :artist_id, presence: true
  validates :title, uniqueness: { scope: :artist_id }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :shared_viewers,
    through: :artworks,
    source: :viewers
  
  def self.artworks_for_user_id(user_id)
    owned_art = Artwork
        .where("artist_id = #{user_id}")

    viewed_art = Artwork
        .joins(:artwork_shares)
        .where("#{user_id} = viewer_id")

    owned_art + viewed_art
  end

end
