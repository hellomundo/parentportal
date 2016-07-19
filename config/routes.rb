Rails.application.routes.draw do
  resources :families
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
