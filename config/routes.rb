Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :card_lists
end
