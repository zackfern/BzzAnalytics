BuzzAnalytics::Application.routes.draw do

  # Authentication Routes.
  resources :sessions, only: [ :new, :destroy ]
  get 'auth/:provider/callback', to: 'sessions#create'

  root to: 'visits#index'
end
