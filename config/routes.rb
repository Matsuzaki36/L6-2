Rails.application.routes.draw do
    resources :products
    root 'top#main'
    get 'top/main'
    resources :cartitems, only: [:new, :create, :destroy]
    resources :carts, only: [:show]
end
