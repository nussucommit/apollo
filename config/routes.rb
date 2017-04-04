Rails.application.routes.draw do
  devise_for :user

  default_url_options host: 'localhost:3000'
  root 'duties#index'

  resources :users
  resources :duties, only: [:index] do
    collection do
      patch '/grab', to: 'duties#process_grab'
      patch '/drop', to: 'duties#process_drop'
      get '/mass-edit', to: 'duties#mass_edit'
      patch '/mass-update', to: 'duties#mass_update'
    end
  end
  resources :places

  get '/admin', to: 'others#admin'
end
