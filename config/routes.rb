Rails.application.routes.draw do
  
  resources :downtimes
  devise_for :users
  resources :actionitems do
    resources :comments
  end

  resources :production_runs do
    resources :production_hours
  end

  root 'welcome#index'


end
