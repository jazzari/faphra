Rails.application.routes.draw do
 
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'phrases#index'

  resources :phrases do 
  	member do 
  		get 'like'
  	end
  end

  get '/ownphrases', to: 'users#index'

end
