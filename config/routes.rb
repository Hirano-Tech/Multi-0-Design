Rails.application.routes.draw do
  devise_for :users
  root to: 'influencers#index'

  resources :influencers, only: :show do
    collection do
      resources :influencer_likes
      resources :youtube_channels, only: :edit
    end
  end

  resources :register_products, only: [:index, :new, :create]
  resources :youtube_videos, only: :new
end
