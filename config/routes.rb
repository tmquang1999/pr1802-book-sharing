Rails.application.routes.draw do
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :books, only: [:create, :destroy]
  scope "(:locale)", locale: /en|vi/ do
    root 'static_pages#home'
  end
end
