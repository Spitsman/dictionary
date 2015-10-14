Rails.application.routes.draw do
  root 'dictionary#index'
 	get "index" => 'dictionary#index'
  post "lookup" => "dictionary#lookup"
  get "journal" => "dictionary#journal"
  delete "journal/destroy" => "dictionary#destroy"
  get "signup" => "users#new"
  resources :users
  get 'login' => 'sessions#new'
  post "login" => "sessions#create"
  delete 'logout' => 'sessions#destroy'
end

