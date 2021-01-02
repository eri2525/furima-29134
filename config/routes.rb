Rails.application.routes.draw do
  #get 'purchase_records/index'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchase_records, only: [:index, :create]
  end
  resources :addresses, only: :create
end
