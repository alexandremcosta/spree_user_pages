Spree::Core::Engine.routes.draw do
  resources :pages, only: [:edit, :update]

  get '/search' => 'search#result', as: :search

  as :spree_user do
    patch '/user/spree_user/confirmation' => 'user_confirmations#update', :via => :patch, :as => :update_spree_user_confirmation
  end
end
