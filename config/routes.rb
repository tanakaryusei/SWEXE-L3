Rails.application.routes.draw do
  root "tweets#index"
  resources :tweets
  get "get_image/:id", to: "tweets#get_image"
end