Rails.application.routes.draw do
  resources :daily_movements
  resources :general_expenses
  resources :bills
  resources :currencies
  resources :cashiers
  root to: 'home#hello'
  get 'home/hello'
  devise_scope :user do
    get 'users/sign_in/cashier', to: 'users/sessions#sign_in_cashier'
  end
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
