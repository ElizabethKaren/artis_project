Rails.application.routes.draw do
  get('status' => 'status#index')
  resources :devices
  resources :reports, only: [:index, :show ]
  resources :heartbeats, except: [:update, :destroy]
  post '/alive/api', to: 'heartbeats#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
