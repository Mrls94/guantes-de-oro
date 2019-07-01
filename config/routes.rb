Rails.application.routes.draw do
  resources :sign_in_comments
  root to: 'home#hello'
  get 'home/hello'
  devise_scope :user do
    get 'users/sign_in/cashier', to: 'users/sessions#sign_in_cashier'
    post 'users/session_cashier', to: 'users/sessions#session_cashier'
    post '/users', to: 'users#create'
    get 'confirm_cashier_status', to: 'users/sessions#confirm_cashier_status'
  end
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :daily_movements
  resources :general_expenses
  resources :bills
  resources :currencies
  resources :cashiers
  resources :users
end
