class Influencer < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :finders

  has_one :youtube_channel
  has_one :youtube_video
  has_many :products
end
