Wh::Application.routes.draw do
  resources :subscribers, only: [ :create, :destroy ]

  root 'site#index'
end
