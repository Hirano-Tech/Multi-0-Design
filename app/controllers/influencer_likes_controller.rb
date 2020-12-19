class InfluencerLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    InfluencerLike.create(influencer_id: params[:id].to_i, user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    InfluencerLike.find_by(influencer_id: params[:id].to_i, user_id: current_user.id).destroy
    redirect_to root_path
  end
end






# def destroy
#   user = current_user
#   post = Post.find(params[:post_id])
#   like = Like.find_by(user_id: user.id, post_id: post.id)
#   like.delete
# end
# def create
#   user = current_user
#   post = Post.find(params[:post_id])
#   like = Like.create(user_id: user.id, post_id: post.id)
# end



# def set_like
#   @post = Post.find(params[:post_id])
# end
