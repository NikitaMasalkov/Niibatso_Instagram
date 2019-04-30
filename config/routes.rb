Rails.application.routes.draw do
  resources :users
  resources :photos
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  resources :users do
    resources :photos
  end
end


