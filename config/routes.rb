Rails.application.routes.draw do
  root to: 'influencers#index'

  resources :influencers, only: :show do
    collection do
      resources :youtube_channels, only: :edit
    end
  end

  resources :youtube_videos, only: :new
end
