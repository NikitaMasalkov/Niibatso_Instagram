Rails.application.routes.draw do
  resources :users
  resources :users do
    resources :photos
  end
end

