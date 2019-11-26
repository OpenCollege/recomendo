Rails.application.routes.draw do
  resources :categories
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home', to: 'application#home'
  root to: 'posts#new'
end
