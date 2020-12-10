class YoutubeChannelsController < ApplicationController
  def edit
    require 'google/apis/youtube_v3'
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.YouTube[:YouTube_Data_API]

    influencer = Influencer.find(params[:id])

    if influencer.name == 'プチプラのあや'
      channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UCC_ElJAc9JrtkMm3zTTJ1_A').to_h

      elsif influencer.name == 'まる'
        channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UCA8AbMRz2xvJuTqPKrVscRw').to_h

      elsif influencer.name == '佐々木あさひ'
        channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UCfCY70zRsvnnKzQ39mBq0rw').to_h

      elsif influencer.name == 'ななみ'
        channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UCLO1yCo0gDgpXhyM0fXfXXA').to_h

      elsif influencer.name == '佐藤優里亜'
        channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UC51Dkxcc01mSJ6TknHqxSiA').to_h

      elsif influencer.name == 'かんだま'
        channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UC9bet8Rcj620A9n_qBj4nUg').to_h

      elsif influencer.name == '水越みさと'
        channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UCffg7iYU2K7HFJDhylZzUBw').to_h

      elsif influencer.name == 'きりまる'
        channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UCI_xeCXCHd_iTdOG6OIZYiA').to_h

      elsif influencer.name == 'なぐもふうか'
        channel_list = youtube.list_channels([:snippet, :brandingSettings, :statistics], id: 'UCwziFMRr3O1wkSqBeo3K6Yg').to_h
    end

    channel_id = channel_list[:items][0][:id]

      if influencer.name == 'きりまる'
        channel_header = channel_list[:items][0][:branding_settings].default = nil
      else
        channel_header = channel_list[:items][0][:branding_settings][:image][:banner_external_url]
      end

    channel_icon = channel_list[:items][0][:snippet][:thumbnails][:medium][:url]
    channel_subscriber = channel_list[:items][0][:statistics][:subscriber_count]

    influencer.YoutubeChannel.update(channel_id: channel_id, header: channel_header, icon: channel_icon, subscriber: channel_subscriber)

    redirect_to root_path
  end
end
