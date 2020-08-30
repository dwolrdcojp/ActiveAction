Rails.application.routes.draw do
  
  
  resources :downtime_criteria
  devise_for :accounts, controllers: { sessions: 'accounts/sessions', registrations: 'accounts/registrations' }

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :downtimes
  resources :downtime_criteria

  resources :actionitems do
    resources :comments
  end

  resources :production_runs do
    resources :production_hours
  end

  root 'welcome#index'

end
