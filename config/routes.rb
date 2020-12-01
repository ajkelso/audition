Rails.application.routes.draw do
  root 'static#home'
  resources :directors, exclude: [:destroy]
  resources :casting_directors, exclude: [:destroy]
  resources :actors, exclude: [:destroy] do
    resources :auditions, shallow: true
  end
  resources :projects, exclude: [:destroy] do
    resources :auditions, shallow: true
  end
  resources :auditions
  resources :sessions, only: [:new, :create]
  delete "/session", to: "sessions#destroy", as: 'sign_out'

  get '/actors/profile/:id', to: 'actors#profile', as: 'actor_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
