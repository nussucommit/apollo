Rails.application.routes.draw do
  devise_for :user

  default_url_options host: 'localhost:3000'
  root 'duties#index'

  resources :users
  resources :duties, only: [:index, :edit, :update] do
    collection do
      patch '/grab', to: 'duties#process_grab'
      patch '/drop', to: 'duties#process_drop'
    end
  end
  resources :places

  get '/admin', to: 'others#admin'
end
