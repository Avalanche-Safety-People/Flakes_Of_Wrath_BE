Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/', to: 'landing#index'
      
      resources :users, only: %i[index show update] do
        resources :trips, only: %i[create show index update destroy]
          patch '/trips', to: 'trips#update'
        resources :emergency_contacts, only: %i[index show create update destroy]
         patch '/emergency_contacts', to: 'emergency_contacts#update'
      end


      resources :areas, only: %i[index show] do
        resources :forecasts, only: %i[index]
      end
    end
  end
end
