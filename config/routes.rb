Rails.application.routes.draw do
  root 'posts#index'

  get '/about' => 'home#about'
  get '/contact' => 'home#contact'

  resources :posts, shallow: true do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users do
    resources :likes, only: :index 
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :password_resets, except: [:index, :destroy]

  namespace :admin do
    resources :panel, only: [:index]
  end

end
