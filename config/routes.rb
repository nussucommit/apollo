Rails.application.routes.draw do
  devise_for :user

  default_url_options host: 'localhost:3000'
  root 'duties#index'

  resources :users
  resources :duties, only: [:index, :edit, :update] do
    patch '/grab', to: 'duty#process_grab'
    patch '/drop', to: 'duty#process_drop'
  end
  resources :places
end
