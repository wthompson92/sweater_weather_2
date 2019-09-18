Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show'
      get '/gifs', to: 'gifs#index'
      get '/backgrounds', to: 'backgrounds#index'
      post '/user', to: 'users#create'
      post '/session', to: 'sessions#create'
      post '/road_trip', to: 'road_trip#new'

    end
  end
end
