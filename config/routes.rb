Rails.application.routes.draw do
  resources :tasks
  devise_for :parents
  resources :parents
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
