Rails.application.routes.draw do
  devise_for :administrators
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get "/about" => "homes#about"
  
  namespace :public do
  	resources :cart_items, only: [:index, :create, :update, :destroy]
  	resources :items, only: [:index, :show]
  	resources :orders, only: [:new, :create, :index]
  	resources :customers, only: [:show, :update, :edit]
  	resources :shippings, only: [:index, :create, :destroy, :edit, :update]
  	get "orders/thanks" => "orders#thanks"
  	delete "cart_items/destroy_all" => "cart_items#destroy_all"
  	get "customers/:id/withdraw" => "customers#withdraw"
  	patch "customers/:id/withdraw" => "customers#update"
  	get "orders/confirm" => "orders#confirm"
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    get "orders/today" => "orders#today"
  end

end
