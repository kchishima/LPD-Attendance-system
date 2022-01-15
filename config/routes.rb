Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  namespace :admins do
  resources :members, only: [:show,:index]
  end
  resources :members, only: [:show,:index]
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

  resources :work_scheduleds,only: [:show,:index]
  resources :attendance_applications,only: [:index,:show,:new,:create,:edit,:update]
  resources :attendance_informations

end
