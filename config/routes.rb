Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealerships#new'
  post '/dealerships', to: 'dealerships#create'
  get '/dealerships/:id', to: 'dealerships#show'

  get '/dealerships/:id/edit', to: 'dealerships#edit'
  patch '/dealerships/:id', to: 'dealerships#update'
  # delete '/dealerships/:id', to: 'dealerships#destroy'

  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'
  get '/cars/:id/edit', to: 'cars#edit'
  patch '/cars/:id', to: 'cars#update'
  # delete '/cars/:id', to: "cars#destroy"

  get '/dealerships/:id/cars', to: 'dealership_cars#index'
  get '/dealerships/:id/cars/new', to: 'dealership_cars#new'
  post '/dealerships/:id/cars', to: 'dealership_cars#create'
end
