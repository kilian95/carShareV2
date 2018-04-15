Rails.application.routes.draw do

	# Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  devise_for :users
  devise_for :admins
  
  resources :messages, only:[:create]
  resources :offers do
    resources :reviews, only:[:create, :new]
  end

  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get '/search' => 'offers#search'

	resources :users, only:[:show] do 
		resources :chats, only: [:index, :show, :create]
	end

  namespace :admins do
    root to: "dashboard#index"
    get "offers", to: "offers#index"
    get "offers/:id", to: "offers#show", as: 'offer'
    get "users", to: "users#index"
    get "users/:id", to: "users#show", as: 'user'
  end

  root "offers#index"
end
