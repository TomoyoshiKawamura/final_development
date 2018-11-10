Rails.application.routes.draw do
  devise_for :users
  root'items#index'
  # resources :credit_cards
  # resources :personal_informations
  # resources :reviews
  # resources :item_images
  resources :items do
    collection do
      get 'search'
    end
    member do
      post 'add_item'
    end

  end
  # resources :cart_items
  # resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ↓should be post
  # get 'carts/add_item' => 'carts#add_item' 
  # post '/update_item' => 'carts#update_item'
  # delete '/delete_item' => 'carts#delete_item'

end
