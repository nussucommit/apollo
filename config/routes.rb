Rails.application.routes.draw do
  devise_for :users

  resources :duties
  root 'duties#index'
end
