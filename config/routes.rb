Rails.application.routes.draw do
  root 'cities#index'
  resources :cities do
    collection do
      get :distance, :as => :distance
      get :truckage, :as => :truckage
    end   
  end
end
