class Product < ApplicationRecord
  belongs_to :influencer, foreign_key: :influencer_id
  has_and_belongs_to_many :youtube_videos
  # has_many :youtube_videos, through: :youtube_products
end
