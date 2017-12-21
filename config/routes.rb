Rails.application.routes.draw do

	# Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users

  resources :messages, only:[:create]
  resources :offers
	resources :users, only:[:show] do 
		resources :chats, only: [:index, :show, :create]
	end

  root "offers#index"
end
