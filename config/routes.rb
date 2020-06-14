Rails.application.routes.draw do
 
  root 'phrases#index'

  resources :phrases

end
