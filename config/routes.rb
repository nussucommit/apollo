Rails.application.routes.draw do
  default_url_options host: 'localhost:3000'
  root 'duties#index'

  resources :users 
  patch '/default', to: 'duties#mass_set_default'
  resources :duties do, only: [:index, :edit, :update]
    patch '/grab', to: 'duty#process_grab'
    patch '/drop', to: 'duty#process_drop'
  end
end
