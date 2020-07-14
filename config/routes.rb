Rails.application.routes.draw do
  devise_for :administrators, :controllers => {
    :sessions => 'administrators/sessions'
}
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get "/about" => "homes#about"

#customer
  namespace :public do
  	resources :cart_items, only: [:index, :create, :update, :destroy]
    get "cart_items/destroy_all" => "cart_items#destroy_all"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
  	resources :items, only: [:index, :show]
    resources :genres, only: [:index] do
      resources :items, only: [:index]
    end
    post '/orders/create_shipping' => 'orders#create_shipping' #情報入力画面での配送先登録用のアクション
    get "/orders/confirm" => "orders#confirm"
    get '/create_order' => 'orders#create_order' #購入確定のアクション
    get "/thanks_order" => "orders#thanks"
    resources :orders, only: [:new, :create, :index, :show]
    resources :customers, only: [:show, :update, :edit]
    get "customers/:id/withdraw" => "customers#withdraw"
    patch '/customers/:id/withdrow' => 'customers#switch', as: 'withdrow_switch_customer' #会員ステータスの切替
    patch "customers/:id/withdraw" => "customers#update"
  	resources :shippings, only: [:index, :create, :destroy, :edit, :update]
  end


#administrators
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    get "orders/today" => "orders#today"
    resources :orders, only: [:index, :show]
    patch '/orders/:id/ostatus' => 'orders#status_update', as: "status" # 注文ステータスupdate
    patch '/orders/:id/making_status' => 'orders#making_status_update', as: "making_status" # 製作ステータスupdate
  end

end