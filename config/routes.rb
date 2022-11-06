Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/', to: 'landing#index'
      
      resources :users, only: %i[index show] do
        resources :trips, only: %i[create show index]
        resources :emergency_contacts, only: %i[index create update]
         patch '/emergency_contacts', to: 'emergency_contacts#update'
      end


      resources :areas, only: %i[index show] do
        resources :forecast, only: %i[index]
      end
    end
  end
end
