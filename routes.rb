Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :home

  resources :stock_batches do
    resources :media
  end 

  
  resources :media, only: %i[new update edit create] do
    collection do
      get :show
      get :print
    end
  end

  resources :media_types
  resources :media_type_suites

  resources :measurements 
end


