Rails.application.routes.draw do
  resources :buyer_stocks
  resources :transactions, only: [:create, :destroy]
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  resources :roles
  root 'users#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'manage_users', to: 'users#users_index'
  get 'stock_view', to: 'users#stock_view'

end
