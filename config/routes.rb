BuzzAnalytics::Application.routes.draw do

  # Authentication Routes.
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'

  root to: 'visits#index'
end
