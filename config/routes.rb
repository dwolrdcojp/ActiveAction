Rails.application.routes.draw do
  
  devise_for :accounts, controllers: { sessions: 'accounts/sessions', registrations: 'accounts/registrations', invitations: 'users/invitations' }

  devise_for :users, controllers: { sessions: 'users/sessions', invitations: 'users/invitations' }

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
