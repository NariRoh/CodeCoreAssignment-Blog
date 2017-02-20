Rails.application.routes.draw do
  root 'home#index'

  get '/about' => 'home#about'
  get '/contact' => 'home#contact'

  resources :posts, shallow: true do
    resources :comments, only: [:create, :destroy]
  end
end
