Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resources :products, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
