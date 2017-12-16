Rails.application.routes.draw do
  devise_for :users
  resources :offers

  root "offers#index"
end
