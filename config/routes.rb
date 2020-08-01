Rails.application.routes.draw do
  
  resources :actionitems do
    resources :comments
  end

  root 'welcome#index'


end
