Rails.application.routes.draw do
  devise_for :users
   root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/admin", to: 'admin#admin_panel'
  post "/update_query", to: 'admin#update_query'
  get "/auth/:provider/callback" => 'sessions#create'
  get "/load_queries" => 'admin#load_queries' 
end
