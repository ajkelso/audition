Rails.application.routes.draw do
  resources :directors
  resources :casting_directors
  resources :projects
  resources :auditions
  resources :actors, exclude: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
