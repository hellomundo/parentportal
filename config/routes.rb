Rails.application.routes.draw do

  get 'welcome/index'

  root to: 'tasks#index'

  devise_for :users

  namespace :admin do
    # get '', to: 'dashboard#index', as: '/'

    root to: 'dashboard#index', as: "/"

    resources :task_types
    resources :families
    resources :users
  end

  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
