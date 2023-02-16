# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
  validates :artwork_id, presence: true
  validates :viewer_id, presence: true, uniqueness: { scope: :artwork_id, message: 'User can\'t be shown artwork twice.' }

  belongs_to :artworks,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewers,
    foreign_key: :viewer_id,
    class_name: :User
end
