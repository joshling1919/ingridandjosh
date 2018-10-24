Rails.application.routes.draw do
  root 'home#index'

  get 'rsvp', to: 'rsvp#show'
  resources :guests, only: [] do
    get :search, on: :collection
  end
end
