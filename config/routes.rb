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
  resources :auditions do
    resources :notes
  end
  resources :sessions, only: [:new, :create]
  delete "/session", to: "sessions#destroy", as: 'sign_out'

  get '/actors/:id/profile', to: 'actors#profile', as: 'actor_profile'

  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
