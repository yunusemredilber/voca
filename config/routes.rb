Rails.application.routes.draw do
  get 'user_panel/index'
  get 'votes/create'
  get 'votes/destroy'
  get 'partner_panel/index'
  get 'admin', to: 'admin_panel#index', as: :admin_panel
  get 'partner', to: 'partner_panel#index', as: :partner_panel
  get 'user', to: 'user_panel#index', as: :user_panel
  resources :sessions, only: %i[create destroy]
  resources :partners, only: %i[create destroy]
  resources :pins, only: %i[create]
  get 'sessions/user'
  get 'sessions/admin'
  get 'sessions/partner'
  root 'welcome#index'
  resources :users
  resources :votes
end
