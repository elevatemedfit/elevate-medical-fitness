Rails.application.routes.draw do
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/patients' => 'patients#index'
  get '/patients/new' => 'patients#new', as: 'new_patient'
  post '/patients' => 'patients#create'
  get '/patients/:id' => 'patients#show', as: 'patient'
  get '/patients/:id/edit' => 'patients#edit', as: 'edit_patient'
  patch '/patients/:id' => 'patients#update'
  delete '/patients/:id' => 'patients#destroy'

  
  # patch '/goals/:id/accomplish', to: 'goals#accomplish', as: :goals_accomplish

  
  resources :users, only: [:new, :create]
  resources :patients do 
    resources :goals, except: [:edit, :update]
  end
  
  resources :patient_workouts
  resources :workouts  do
    resources :exercises, only: [:new, :create]
  end

  resources :exercises, only: [:new, :create, :show, :index]

  
  
  root 'welcome#home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

