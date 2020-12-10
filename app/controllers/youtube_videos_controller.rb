class YoutubeVideosController < ApplicationController
  def new
    require 'google/apis/youtube_v3'
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.YouTube[:YouTube_Data_API]

    options = { channel_id: 'YouTube チャンネルID', q: '検索キーワード' , order: 'date', max_results: '取得するビデオの数' }
    video_list = youtube.list_searches(:snippet, options).to_h

    Date.parse("2020-11-22T12:41:12Z").strftime("%Y-%m-%d")
  end
end
