Rails.application.routes.draw do

  devise_for :admins
  devise_for :members
  namespace :admins do
    resources :members, only: [:new, :create, :index, :show, :edit,:update,:destroy]
    resources :attendance_informations
    resources :work_scheduleds,only: [:index,:show,:edit,:update,:destroy]
  end
  resources :members, only: [:show, :update]

  root to: "homes#index"

  get '/time_in', to: 'attendance_informations#time_in'
  get '/time_out', to: 'attendance_informations#time_out'

  # post '/' => 'attendance_informations#create'
  # get '/time_out' => 'attendance_informations#new'
  # patch '/time_out' => 'attendance_informations#new'
  # get '/attendance' => 'attendance_informations#index'
  # get '/attendance/:id' => 'attendance_informations#edit'
  # patch '/attendance/:id' => 'attendance_informations#update'
  # get '/attendance_informations' => 'attendance_informations#show'

  resources :work_scheduleds,only: [:index,:new,:create]
  resources :attendance_informations
  # get 'charts/index'
  resources :charts,only: [:index, :edit, :update, :destroy]

end
