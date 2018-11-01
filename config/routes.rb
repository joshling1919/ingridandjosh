Rails.application.routes.draw do
  root 'static_pages#home'
  get 'photos', to: 'static_pages#photos'

  get 'rsvp', to: 'rsvp#show'
  resources :guests, only: [] do
    get :search, on: :collection
    post :rsvp, on: :collection
  end
end
