Rails.application.routes.draw do
  root 'dictionary#index'
  get "index" => 'dictionary#index'
  get "get_langs" => "dictionary#get_langs"
  get "lookup" => "dictionary#lookup"
end

