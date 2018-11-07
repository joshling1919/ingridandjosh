Rails.application.routes.draw do
  root 'static_pages#home'
  get 'photos', to: 'static_pages#photos'
  get 'stories', to: 'static_pages#stories'
  get 'registry', to: 'static_pages#registry'

  get 'rsvp', to: 'rsvp#show'
  resources :guests, only: [] do
    get :search, on: :collection
    post :rsvp, on: :collection
    get :rsvp_csv, on: :collection
  end
end
