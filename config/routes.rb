Rails.application.routes.draw do
  
  devise_for :users
  resources :actionitems do
    resources :comments
  end

  root 'welcome#index'


end
