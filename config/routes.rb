Rails.application.routes.draw do
  get 'welcome/index'

  namespace :admin do
    resources :task_types
  end

  resources :families

  devise_for :users

  root 'welcome#index'

  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
