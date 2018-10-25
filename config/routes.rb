Rails.application.routes.draw do
  devise_for :users
  root'items#index'
  resources :credit_cards
  resources :personal_informations
  resources :reviews
  resources :item_images
  resources :items
  resources :cart_items
  resources :carts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
