Wh::Application.routes.draw do

  get 'overview' => 'dashboard#index', as: :dashboard

  resources :subscribers, only: [ :index, :destroy ]
  resources :registrants, only: [ :index, :destroy ]
  resources :organizations
  resources :users
  resources :profiles
  resources :affiliations
  resources :contacts

  # Subscriptions (beta testing)
  get 'subscriptions/:code' => 'subscriptions#new', as: :subscription
  post 'subscriptions' => 'subscriptions#create'

  # Sign in/out
  get    'login'  => 'session#new',     as: :login
  post   'login'  => 'session#create'
  delete 'logout' => 'session#destroy', as: :logout
  get    'logout' => 'session#destroy'  # temporary for development

  # Registration
  get  'register/:code' => 'registration#new', as: :register
  post 'register/:code' => 'registration#create'

  # Password reset
  get   'reset/:code' => 'password#edit', as: :reset
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  get 'privacy' => 'site#privacy'
  get 'terms'   => 'site#terms'

  root 'site#index'
end
