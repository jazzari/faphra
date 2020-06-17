Rails.application.routes.draw do
 
  devise_for :users
  root 'phrases#index'

  resources :phrases

end
