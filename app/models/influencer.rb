class Influencer < ApplicationRecord
  has_one :youtube_channel
  has_many :youtube_videos
  has_many :products
end
