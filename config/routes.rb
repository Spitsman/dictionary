Rails.application.routes.draw do
  root 'dictionary#index'
 	get "index" => 'dictionary#index'
  post "lookup" => "dictionary#lookup"
  get "journal" => "dictionary#journal"
  delete "journal/destroy" => "dictionary#destroy"
end

