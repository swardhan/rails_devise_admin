Rails.application.routes.draw do
  devise_for :users
   root to: "home#index"

  get "/admin", to: 'admin#admin_panel'
  post "/update_query", to: 'admin#update_query'
  get "/auth/:provider/callback" => 'sessions#create'
  get "/load_queries" => 'admin#load_queries' 
  post "/reply", to: 'home#reply'

end
