Spree::Core::Engine.routes.draw do
  resources :pages, only: [:edit, :update]
end
