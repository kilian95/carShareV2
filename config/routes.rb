Rails.application.routes.draw do
  devise_for :users
  
  resources :offers
	resources :users
	

  root "offers#index"
end
