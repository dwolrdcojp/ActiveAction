Rails.application.routes.draw do
  
  
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :downtimes

  resources :actionitems do
    resources :comments
  end

  resources :production_runs do
    resources :production_hours
  end

  root 'welcome#index'

end
