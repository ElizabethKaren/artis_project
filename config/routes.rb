Rails.application.routes.draw do
  resources :devices
  resources :reports, only: [:index, :show, :create ]
  resources :heartbeats, except: [:update, :destroy]
  post '/api/alive', to: 'heartbeats#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
