Rails.application.routes.draw do
  root to: 'influencers#index'

  resources :influencers, only: :show
  resources :youtube_apis, only: :edit
end
