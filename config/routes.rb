Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :systems
  resources :products
  resources :news
  resources :customers
  resources :requests
  resources :statics
  scope '/api' do
    scope '/v1' do
      resources :systems, controller: :api_systems do
        get "/systems" => "api_systems#systems"
        get "/products" => "api_systems#products"
      end
      resources :products, controller: :api_products do
        get "/systems" => "api_products#systems"
      end
      resources :news, controller: :api_news
      resources :customers, controller: :api_customers
      get "/statics" => "api_statics#index"
      get "/statics/:key" => "api_statics#show_by_key"
      get "/countries" => "api_statics#show_countries"
      post "/send_datasheet" => "api_datasheet_mailer#send_datasheet"
      post "/send_design" => "api_design_mailer#send_design"
      get "/cold_flexibility" => "api_products#cold_flexibility"
      get "/carrier" => "api_products#carrier"
      get "/all_filters" => "api_products#all_filters"
      get "/products_list" => "api_products#products_list"
    end
  end
end
