Rails.application.routes.draw do
  get 'cards/index'

  get 'cards/import'

  devise_for :users
  root 'home#index'
  resources :card_lists do
    resources :cards do
      collection do
        post :import
        delete 'destroy_multiple'
      end
    end
  end
end
