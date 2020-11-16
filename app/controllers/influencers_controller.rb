class InfluencersController < ApplicationController
  before_action :url_shorter, only: [:index, :show]
  def index
    @products = Product.page(params[:page]).per(8)
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
