Rails.application.routes.draw do

  root "task#index"

  #TASK ROUTES
  resources :task

  #PROF ROUTES
  resources :prof, only: [:index, :create, :destroy]

  #EVENT ROUTES
  resources :event, only: [:index, :create, :destroy]

  #HANDIN IN ROUTES
  resources :handing_in, only: [:index, :create, :destroy]

  #SUBJECT ROUTES
  resources :subject, only: [:index, :create, :destroy]
  
end