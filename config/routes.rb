Rails.application.routes.draw do
  root 'static#home'
  resources :directors, only: [:index, :show, :edit, :update] do
    resources :projects, exclude: [:new]
    resources :auditions, shallow: true
  end
  resources :castings, only: [:index, :show, :edit, :update] do
    resources :projects, exclude: [:new]
    resources :auditions, shallow: true
  end
  resources :actors, only: [:index, :show, :edit, :update] do
    resources :auditions, shallow: true
  end
  resources :projects, exclude: [:destroy, :new] do
    resources :auditions, shallow: true
  end
  resources :auditions do
    resources :notes
  end
  resources :sessions, only: [:new, :create]
  delete "/session", to: "sessions#destroy", as: 'sign_out'
  #profile
  get '/actors/:id/profile', to: 'actors#profile', as: 'actor_profile'
  get '/directors/:id/profile', to: 'directors#profile', as: 'director_profile'
  get '/castings/:id/profile', to: 'castings#profile', as: 'casting_profile'
  #google sign up/in 
  get '/auth/google_oauth2/callback', to: 'sessions#google_login'
  post '/google_signup', to: 'sessions#google_signup'
  #signup
  get '/signup', to: 'sessions#signup'
  post '/signup', to: 'sessions#create_user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
