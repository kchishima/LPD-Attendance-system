Rails.application.routes.draw do
  devise_for :members
  root to: 'members#new'
  root to: "home#index"
  resources :members, only: [:show]

end
