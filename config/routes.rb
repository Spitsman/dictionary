Rails.application.routes.draw do
  root 'dictionary#index'
 	get "index" => 'dictionary#index'
  post "lookup" => "dictionary#lookup"

  get '/journal' => 'journal#index', as: :journal
  delete "journal/destroy" => "journal#destroy", as: :journal_destroy

  get 'login' => 'sessions#new', as: :login
  post "login" => "sessions#create"
  delete 'logout' => 'sessions#destroy', as: :logout

  get 'profile' => 'users#profile'
  get 'users/show' => 'users#show', as: :show_users
  get "signup" => "users#new", as: :signup
  delete 'destroy' => 'users#destroy', as: :destroy_user
  resources :users  
end

