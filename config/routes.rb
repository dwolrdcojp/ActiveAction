Rails.application.routes.draw do
  
  devise_for :users
  resources :actionitems do
    resources :comments
  end

  resources :production_runs

  root 'welcome#index'


end
