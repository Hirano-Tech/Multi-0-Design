class Influencer < ApplicationRecord
  has_one :youtube_channel
  has_one :youtube_video
  has_many :products
end
