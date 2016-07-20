Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  namespace :admin do
    resources :task_types
    resources :families
  end

  devise_for :users

  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
