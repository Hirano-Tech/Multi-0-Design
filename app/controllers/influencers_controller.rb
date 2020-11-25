class InfluencersController < ApplicationController
  before_action :url_shorter, only: [:index, :show]
  def index
    if params[:sort] == "twitter"
      @influencers = Influencer.all.order(twitter_follower: :desc)
    elsif params[:sort] == "instagram"
      @influencers = Influencer.all.order(instagram_follower: :desc)
    elsif params[:sort] == "youtube"
      @influencers = Influencer.all.order(youtube_follower: :desc)
    else
      @influencers = Influencer.all
    end

    if Rails.env.production?
      @products = Product.page(params[:page]).per(8).order(Arel.sql('RANDOM()'))
    else
      @products = Product.page(params[:page]).per(8).order(Arel.sql('RAND()'))
    end
  end

  def show
    @influencer = Influencer.find(params[:id])
  end

  private
  def url_shorter
    @url_shorter = {
      aws_images: "https://multi-0-design.s3-ap-northeast-1.amazonaws.com/images/",
      twitter: "https://twitter.com/",
      instagram: "https://www.instagram.com/",
      youtube: "https://www.youtube.com/channel/"
    }
  end
end
