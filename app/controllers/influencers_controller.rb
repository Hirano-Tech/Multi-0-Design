class InfluencersController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'json'


  def index
    # ↓ 並び替え機能（インフルエンサー 一覧）↓
    if params[:sort] == "twitter"
      @influencers = Influencer.all.order(twitter_follower: :desc)
    elsif params[:sort] == "instagram"
      @influencers = Influencer.all.order(instagram_follower: :desc)
    elsif params[:sort] == "youtube"
      @influencers = Influencer.all.order(youtube_follower: :desc)
    else
      @influencers = Influencer.all
    end
    # ↑ 並び替え機能（インフルエンサー 一覧）↑

    if params[:sort] == "uniqlo"
      @products = Product.page(params[:page]).per(8).where(brand: "UNIQLO")
    elsif params[:sort] == "gu"
      @products = Product.page(params[:page]).per(8).where(brand: "GU")
    elsif params[:sort] == "shimamura"
      @products = Product.page(params[:page]).per(8).where(brand: "dear.ful")
    elsif params[:sort] == "handm"
      @products = Product.page(params[:page]).per(8).where(brand: "H&M")
    elsif params[:sort] == "fifth"
      @products = Product.page(params[:page]).per(8).where(brand: "fifth")
    elsif params[:sort] == "an3pocket"
      @products = Product.page(params[:page]).per(8).where(brand: "An3pocket")
    elsif params[:sort] == "aya"
      @products = Product.page(params[:page]).per(8).where(influencer_id: 1)
    elsif params[:sort] == "maru"
      @products = Product.page(params[:page]).per(8).where(influencer_id: 2)
    elsif params[:sort] == "asahi"
      @products = Product.page(params[:page]).per(8).where(influencer_id: 3)
    elsif params[:sort] == "nanami"
      @products = Product.page(params[:page]).per(8).where(influencer_id: 4)
    else
      if Rails.env.production?
        @products = Product.page(params[:page]).per(8).order(Arel.sql('RANDOM()'))
      else
        @products = Product.page(params[:page]).per(8).order(Arel.sql('RAND()'))
      end
    end
  end

  def show
    if params[:id] == "プチプラのあや" || params[:id] == "まる" || params[:id] == "佐々木あさひ" || params[:id] == "ななみ"
      @influencer = Influencer.find(params[:id])
    else
      redirect_to root_path
    end

    acquisition_date = (Time.now - @influencer.updated_at).divmod(24*60*60)
    acquisition_date[0]
    if acquisition_date[0].to_i >= 7
      require 'google/apis/youtube_v3'
      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = Rails.application.credentials.YouTube[:YouTube_Data_API]
      options = {id: 'UCC_ElJAc9JrtkMm3zTTJ1_A'}
      @aya_channel_banner = youtube.list_channels(:brandingSettings, options).to_h
      @aya_channel_icon = youtube.list_channels(:snippet, options).to_h

      @influencer.update(header: @aya_channel_banner[:items][0][:branding_settings][:image][:banner_external_url])
      @influencer.update(icon: @aya_channel_icon[:items][0][:snippet][:thumbnails][:medium][:url])
    end
  end
end
