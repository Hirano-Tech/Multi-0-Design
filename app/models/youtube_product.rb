class YoutubeProduct < ApplicationRecord
  belongs_to :product
  belongs_to :youtube_video
end
