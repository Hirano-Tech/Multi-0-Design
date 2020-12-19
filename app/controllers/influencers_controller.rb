class InfluencersController < ApplicationController

  def index
    @influencers = Influencer.includes(:youtube_channel, :influencer_likes)

    # ↓ 並び替え機能（インフルエンサー 一覧）↓
    if params[:sort] == "twitter"
      @influencers = Influencer.all.order(twitter_follower: :desc)
    elsif params[:sort] == "instagram"
      @influencers = Influencer.all.order(instagram_follower: :desc)
    elsif params[:sort] == "youtube"
      @influencers = @influencers.order('youtube_channels.subscriber desc')
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
    @influencer = Influencer.includes(:youtube_channel).find(params[:id])
    @video_lists = YoutubeVideo.where(influencer_id: params[:id]).order(published_at: :DESC).includes(:influencer)
  end
end
