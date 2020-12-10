class Influencer < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :finders

  has_one :YoutubeChannel
  has_one :YoutubeVideo
  has_many :product
end
