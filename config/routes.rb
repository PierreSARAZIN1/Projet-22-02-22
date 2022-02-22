Rails.application.routes.draw do
  
  root to: "static_pages#index"
  devise_for :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
