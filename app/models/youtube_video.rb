class YoutubeVideo < ApplicationRecord
  belongs_to :influencer
  has_and_belongs_to_many :products
  # has_many :products, through: :youtube_products
end
