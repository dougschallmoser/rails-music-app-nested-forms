Rails.application.routes.draw do
  resources :notes
  resources :genres
  resources :artists
  resources :songs

  root 'songs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
