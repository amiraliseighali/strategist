Rails.application.routes.draw do
  get 'strategy/index'
  get 'strategy/calculate'
  post 'strategy/calculate'
  #me trying different things to make it work
  resources :strategy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'strategy#index'




  resources :main
end
