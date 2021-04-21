Rails.application.routes.draw do
  resources :tipos
  resources :products do 
    collection do 
      get :csv
      get :pdf
    end
  end
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
