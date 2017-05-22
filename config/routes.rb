Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :vendors
  resources :items
  resources :certification_types

  root to: "static_pages#index"
  
end
