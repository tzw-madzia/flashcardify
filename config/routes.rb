Rails.application.routes.draw do
  get 'cards/index'

  get 'cards/import'

  devise_for :users
  root 'home#index'
  resources :card_lists do
    resources :cards do
      collection { post :import }
    end
  end
end
