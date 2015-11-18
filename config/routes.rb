Rails.application.routes.draw do
  root to: "home#index"
  get "/log-in" => "sessions#new", as: :log_in
  post "/log-in" => "sessions#create"
  delete "/log-out" => "sessions#destroy", as: :log_out
  resources :users 
  resources :tapes
  
end

