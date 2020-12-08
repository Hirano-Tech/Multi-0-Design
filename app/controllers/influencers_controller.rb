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
    @influencer = Influencer.find(params[:id])
  end
end
