Rails.application.routes.draw do
  resources :sessions, only: %i[create destroy]
  get 'sessions/user'
  get 'sessions/admin'
  get 'sessions/partner'
  root 'welcome#index'
  resources :users
end
