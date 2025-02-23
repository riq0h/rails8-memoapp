Rails.application.routes.draw do
  devise_for :users
  get 'memos/index'
  get 'memos/new'
  get 'memos/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'memos#index'
  resources :memos

  # Defines the root path route ("/")
  # root "posts#index"
end
