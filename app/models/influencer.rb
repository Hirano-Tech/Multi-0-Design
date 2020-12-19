class Influencer < ApplicationRecord
  has_one :youtube_channel
  has_many :youtube_videos
  has_many :products

  has_many :influencer_likes
  has_many :users, through: :influencer_likes
end
