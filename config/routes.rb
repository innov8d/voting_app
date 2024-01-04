Rails.application.routes.draw do
  resources :sign_on, only: [:new, :create]
  resources :vote, only: [:index, :create]
  resources :candidate, only: [:create]

  root "sign_on#new"
end
