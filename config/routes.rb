Rails.application.routes.draw do
  root :to => 'home#index'

  get '/about' => 'home#about'
  get '/contact' => 'home#contact'
  # testing show page for now
  get '/show' => 'posts#show'

  resources :posts
end
