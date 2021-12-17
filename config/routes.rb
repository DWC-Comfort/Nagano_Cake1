Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords,],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}

  
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :order_lists, only: [:update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  
  resources :receivers, only: [:index, :create, :edit, :update, :destroy]
  
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items' => 'cart_items#destroy_all'
  
  resources :items, only: [:index, :show]
  
  resources :orders, only: [:index, :show, :new, :create]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/about' => 'orders#about'
  
  get 'customers' => 'customers#show'
  get 'customers/edit' => 'customers#edit'
  patch 'customers' => 'customers#update'
  patch 'customers' => 'customers#withdraw'
  get 'customers/confirm' => 'customers#confirm'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
