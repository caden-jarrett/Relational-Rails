Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
  get '/lead_actors', to: 'lead_actors#index'
  get '/lead_actors/:id', to: 'lead_actors#show'
  get '/lead_actors/:id/movies', to: 'lead_actors#children'
end
