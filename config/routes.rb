Rails.application.routes.draw do
  get 'login', => 'sessions#new'
  post 'login', => 'sessions#create'
  get 'sessions#login'
  get 'welcome', => 'sessions#welcome'
  get 'authorized', => 'session#page_requires_login'
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
