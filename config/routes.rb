Rails.application.routes.draw do
  resources :directors, exclude: [:destroy]
  resources :casting_directors, exclude: [:destroy]
  resources :actors, exclude: [:destroy] do
    resources :auditions, shallow: true
  end
  resources :projects, exclude: [:destroy] do
    resources :auditions, shallow: true
  end
  # resources :auditions
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
