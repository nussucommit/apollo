Rails.application.routes.draw do
  devise_for :users

  resources :duties
  resources :users
  resources :announcements
  root 'duties#index'

  get '/admin', to: 'others#admin'
end
