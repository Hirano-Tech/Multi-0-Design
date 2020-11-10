class InfluencersController < ApplicationController
  before_action :url_shorter, only: [:index]
  def index
    @influencers = Influencer.all
  end

  def show
    @influencer = Influencer.find(params[:id])
  end

  private
  def url_shorter
    @influencer_icon = "https://multi-0-design.s3-ap-northeast-1.amazonaws.com/images/Influencers/"
    @twitter = "https://twitter.com/"
    @instagram = "https://www.instagram.com/"
    @youtube = "https://www.youtube.com/channel/"
  end
end
