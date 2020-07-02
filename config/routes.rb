Rails.application.routes.draw do
  devise_for :administrators
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get "/about" => "homes#about"
  
  namespace :admin do
    resources :items
    resources :customers
    resources :genres
    resources :orders
    get "orders/today" => "orders#today"
  end

  namespace :public do
  	resources :cart_items
  	resources :items
  	resources :orders
  	resources :customers
  	resources :shippings
  	get "orders/thanks" => "orders#thanks"
  	delete "cart_items/destroy_all" => "cart_items#destroy_all"
  	get "customers/:id/withdraw" => "customers#withdraw"
  	patch "customers/:id/withdraw" => "customers#update"
  	get "orders/confirm" => "orders#confirm"
  end


end
