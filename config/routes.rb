Rails.application.routes.draw do
  get 'errors/invalid_phone_number'
  resources :reports
  resources :heartbeats, only: [:index]
  resources :devices, only: [:index, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
