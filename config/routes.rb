Rails.application.routes.draw do
  root to: "home#index"
  get "/log-in" => "sessions#new", as: :log_in
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
  resources :users do
 	 resources :tapes
  end
end

