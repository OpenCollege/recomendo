Rails.application.routes.draw do
  resources :tags
  resources :categories
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home', to: 'application#home'
  root to: 'posts#new'

  namespace :cors do
    get 'get_title'
  end

  # Service Worker Routes
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
end
