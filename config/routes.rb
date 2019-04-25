Rails.application.routes.draw do
  resources :users
  resources :photos
  resources :users do
    resources :photos
  end
end

