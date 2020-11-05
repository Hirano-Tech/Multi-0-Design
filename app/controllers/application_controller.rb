class ApplicationController < ActionController::Base
  def index
    @influencers = Influencer.all
  end

  def show
    @influencer = Influencer.find(params[:id])
  end
end
