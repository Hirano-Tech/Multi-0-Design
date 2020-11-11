class InfluencersController < ApplicationController
  before_action :url_shorter, only: [:index, :show]
  def index
    @influencers = Influencer.all
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
      youtube: "https://www.youtube.com/channel/",
      uniqlo: "https://www.uniqlo.com/jp/ja/products/",
      gu: "https://www.gu-global.com/jp/ja/products/",
      shimamura: "https://www.shop-shimamura.com/item/",
      fifth: "https://5-fifth.com/products/"
    }
  end
end
