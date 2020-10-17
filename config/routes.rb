Rails.application.routes.draw do

  devise_for :users
  get 'api/index'

  get '/' => 'home#index', as: :index
  
  get '/home' => 'home#index', as: :home
  get '/home/profile' => 'home#profile', as: :home_profile
  get '/home/survays' => 'home#survays', as: :home_survays
  get '/home/survay/:id' => 'home#survay', as: :home_survay
  get '/home/survay-response' => 'home#survay_response', as: :home_survay_response
  delete '/survay-response/:id' => 'survay_response#destroy', as: :delete_survay_response
  delete '/user/:id' => 'user#delete_user', as: :delete_user
  resources :survay
  namespace :api do
    namespace :v1 do
      get '/doc' => 'docs#index', as: :docs_index
      resources :survay
      resources :survay_response
      resources :one_time_api_key
    end
  end
end
