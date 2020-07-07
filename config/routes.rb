Rails.application.routes.draw do
  devise_for :administrators
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get "/about" => "homes#about"
  
  namespace :public do
  	resources :cart_items, only: [:index, :create, :update, :destroy]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
  	resources :items, only: [:index, :show]
  	resources :orders, only: [:new, :create, :index]
    post '/orders/create_shipping' => 'orders#create_shipping' #情報入力画面での配送先登録用のアクション
    get "orders/confirm" => "orders#confirm"
    get '/orders/create_order' => 'orders#create_order' #購入確定のアクション
    get "orders/thanks" => "orders#thanks"
  	resources :customers, only: [:show, :update, :edit]
    get "customers/:id/withdraw" => "customers#withdraw"
    patch "customers/:id/withdraw" => "customers#update"
  	resources :shippings, only: [:index, :create, :destroy, :edit, :update]
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    get "orders/today" => "orders#today"
    resources :orders, only: [:index, :show, :update]
  end

end
