Rails.application.routes.draw do

  post ':id/follow_user', to: 'friendships#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'friendships#unfollow_user', as: :unfollow_user
 

  get 'users/search', to: 'users#search', as: 'search_page'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, only: [:show]
  root to: 'phrases#index'

  resources :phrases do 
  	resources :comments
  	member do 
  		get 'like'
  		get 'unlike'
  	end
  end

  get '/ownphrases', to: 'users#index'


  
  get 'friendships/following', to: 'friendships#following'
  get 'friendships/followers', to: 'friendships#follower'


end
