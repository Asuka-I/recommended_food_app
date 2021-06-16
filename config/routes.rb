Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
  resources :foods do
    resource :likes, only: %i[create destroy]
  end
end
