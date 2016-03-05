Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get :dashboard, to: 'home#dashboard'

  resources :payments do
    resources :transfers
  end
end
