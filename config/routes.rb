Rails.application.routes.draw do
  devise_for :users
  root to: 'influencers#index'

  resources :influencers, only: :show do
    collection do
      resources :youtube_channels, only: :edit
    end
  end

  resources :youtube_videos, only: :new
  resources :register_products, only: :new
end
