Rails.application.routes.draw do
  root 'dictionary#index'
 	get "index" => 'dictionary#index'
  post "lookup" => "dictionary#lookup"
  get "journal/index" => "journal#index"
  delete "journal/destroy/:id" => "journal#destroy", as: :journal_destroy
  get "signup" => "users#new"
  resources :users
  get 'login' => 'sessions#new'
  post "login" => "sessions#create"
  delete 'logout' => 'sessions#destroy'
  get 'profile' => 'users#profile'
  get 'users/show' => 'users#show'
  get '/journal/:id' => 'journal#index', as: :journal
end

