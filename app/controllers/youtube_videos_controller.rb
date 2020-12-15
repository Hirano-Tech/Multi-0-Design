class YoutubeVideosController < ApplicationController
  def new
    require 'google/apis/youtube_v3'
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.YouTube[:YouTube_Data_API]

    # options = { channel_id: 'YouTube チャンネルID', q: '検索キーワード' , order: 'date', max_results: '取得するビデオの数' }
    # video_list = youtube.list_searches(:snippet, options).to_h

    # video_id = video_list[:items][0][:id][:video_id]
    # video_title = video_list[:items][0][:snippet][:title]
    # video_thumbnail = video_list[:items][0][:snippet][:thumbnails][:high][:url]
    # video_published_at = Date.parse(video_list[:items][0][:snippet][:published_at]).strftime("%Y-%m-%d")

    # YoutubeVideo.create(
    #   video_id: video_id,
    #   title: video_title,
    #   thumbnail: video_thumbnail,
    #   published_at: video_published_at,
    #   influencer_id:
    # )
  end
end
