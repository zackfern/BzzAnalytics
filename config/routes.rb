BuzzAnalytics::Application.routes.draw do

  resources :filters, only: [ :new, :create, :destroy ] do
    get 'import', action: 'import_analytics'
    resources :visits, only: [ :index ]
  end

  # Authentication Routes.
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'

  get 'kill_session', to: 'sessions#kill' if Rails.env.development?
  root to: 'filters#index'
end
