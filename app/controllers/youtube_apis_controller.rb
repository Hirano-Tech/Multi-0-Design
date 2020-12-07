class YoutubeApisController < ApplicationController
  def edit
    require 'google/apis/youtube_v3'
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.YouTube[:YouTube_Data_API]

    options = {id: 'UCC_ElJAc9JrtkMm3zTTJ1_A'}
    aya_channel_snippet = youtube.list_channels(:snippet, options).to_h
    aya_channel_brandingSettings = youtube.list_channels(:brandingSettings, options).to_h
    aya_channel_statistics = youtube.list_channels(:statistics, options).to_h

    aya_channel_id = aya_channel_snippet[:items][0][:id]
    aya_channel_header = aya_channel_brandingSettings[:items][0][:branding_settings][:image][:banner_external_url]
    aya_channel_icon = aya_channel_snippet[:items][0][:snippet][:thumbnails][:medium][:url]
    aya_channel_subscriber = aya_channel_statistics[:items][0][:statistics][:subscriber_count]

    influencer = Influencer.find(params[:id])
    influencer.YoutubeChannel.update(channel_id: aya_channel_id, header: aya_channel_header, icon: aya_channel_icon, subscriber: aya_channel_subscriber)

    redirect_to root_path
  end
end
