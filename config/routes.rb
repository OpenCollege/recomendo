Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users do
    resources :follows
  end
  resources :tags
  resources :categories
  resources :posts do
    resources :likes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home', to: 'application#home'
  get '/welcome', to: 'application#welcome'
  
  root to: 'posts#index'

  namespace :cors do
    get 'get_title'
  end

  # Service Worker Routes
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
end
