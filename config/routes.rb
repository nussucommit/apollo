Rails.application.routes.draw do
  devise_for :users

  resources :duties
  resources :users
  root 'duties#index'

  get '/admin', to: 'others#admin'
end
