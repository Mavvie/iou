Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get :dashboard, to: 'home#dashboard'

  resources :payments do
    resources :transfers
  end

  resources :groups do |t|
  	member do
      post :add_user
      post :remove_user
    end
  end
end
